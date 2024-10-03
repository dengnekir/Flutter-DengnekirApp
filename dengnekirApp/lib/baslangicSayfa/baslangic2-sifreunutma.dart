import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'baslangic2-SifreDegistirme.dart';
import 'baslangic3-singup.dart';
import 'baslangicOop.dart';
class sifreYenileme extends StatefulWidget {

  @override
  State<sifreYenileme> createState() => _sifreyenilemeState();
}
//AutomaticKeepAliveClientMixin amacı geri gelince her seyin yerli yerince olmasını sağlar
class _sifreyenilemeState extends State<sifreYenileme> with AutomaticKeepAliveClientMixin {
  var formKey1 = GlobalKey<FormState>(); // Kullanıcı adı formu için key
  var formKey2 = GlobalKey<FormState>(); // Kod formu için key
  var tfKullanici = TextEditingController();
  var tfmail = TextEditingController();
  var tfphone = TextEditingController();
  var tfKod = TextEditingController();
  String? _selectedCountryCode = '+90'; // Varsayılan ülke kodu

  // Durumu korumak için gerekli
  @override
  bool get wantKeepAlive => true;

  void _navigateToCountryCodeSearch() async {
    final selectedCode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountryCodeSearch()),
    );

    if (selectedCode != null) {
      setState(() {
        _selectedCountryCode = selectedCode;
      });
    }
  }


  @override

  Widget build(BuildContext context) {
    return DefaultTabController(//SAYFAYI TAB YAPMA
      length: 3,//TAB UZUNLUĞU 3
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container( //MAİN CONTAİNER
                height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [

                    //arkaplan resmi
                    Positioned.fill(
                      child: Image.asset(
                        'image/2SifreYenileme.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    //logo hizalama
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("image/logo.png")
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                // Kullanıcı adı formu || FORM 1
                                Form(
                                  key: formKey1,
                                  child: Container( //CONTAİNER 1
                                    width: 400,
                                    height: 300,
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Colors.deepPurple,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.indigo.withOpacity(0.4),
                                          blurRadius: 16.0,//golge bulanıklılıgı
                                          spreadRadius: 3, // Gölgenin yayılma alanı
                                          offset: Offset(0, 9),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Kullanıcı adı, e-posta veya telefon numaranızı girin",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        //TABBAR KAYDIRMA EKRANI
                                        TabBar(
                                          tabs: [
                                            Tab(
                                              text: "Kullanıcı Adı",
                                            ),
                                            Tab(
                                              text: "Mail",
                                            ),
                                            Tab(
                                              text: "Telefon",
                                            ),
                                          ],
                                          indicatorColor: Colors.deepPurple,
                                          labelColor: Colors.deepPurple,
                                        ),
                                        SizedBox(
                                          height: 150,
                                          child: TabBarView(
                                            children: [
                                              // Kullanıcı Adı
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  controller: tfKullanici,
                                                  decoration:
                                                  customInputDecoration(
                                                    Filcolorr: Colors.white,
                                                    colorr: Colors.white,
                                                    prefixIcon: Icons
                                                        .alternate_email,
                                                    hintText:
                                                    "Kullanıcı Adı",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  validator: (value){
                                                    if(value!.isEmpty){
                                                      return "Kullanıcı Adınızı Giriniz";
                                                    }
                                                    if(value.length>15){
                                                      return "Kullanıcı Adı 15 karakterden Uzun Olamaz";
                                                    }
                                                    // Kullanıcı adında olmaması gereken karakterleri kontrol eden RegExp
                                                    final regex = RegExp(r'[!?\^+%&/|-]');

                                                    if (regex.hasMatch(value)) {
                                                      return "Kullanıcı adınızda ! ? ' ^ + % & / - | karakterler olmamalı";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              // Mail
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.emailAddress,
                                                  controller: tfmail,
                                                  decoration:
                                                  customInputDecoration(
                                                    Filcolorr: Colors.white,
                                                    colorr: Colors.white,
                                                    prefixIcon:
                                                    Icons.email_outlined,
                                                    hintText: "E-posta",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  validator:(value){
                                                    if(value!.isEmpty){
                                                      return "Lütfen Email Giriniz";
                                                    }
                                                    if(!value.contains("@")){
                                                      return "Lütfen Geçerli Bir E-Mail Adresi Giriniz";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              // Telefon
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                            Container(//kod alanı genişliği
                                                              height: 63,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white, // Arka plan rengi (yarı şeffaf beyaz)
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(16),
                                                                  bottomLeft: Radius.circular(16),
                                                                ),
                                                                  border: Border.all(
                                                                      color: Colors.grey.shade500,
                                                                      width: 1.5
                                                                  )
                                                              ),
                                                              child: TextButton(
                                                                onPressed: _navigateToCountryCodeSearch,
                                                                child: Text(
                                                                  _selectedCountryCode ?? 'Henüz ülke kodu seçilmedi',//varsayılan ulke kodu
                                                                  style: TextStyle(fontSize: 20,color: Colors.grey),


                                                                ),
                                                              ),
                                                            ),
                                                      SizedBox(width: 3.0), // elevatedbutton ile TextField arasındaki boşluk
                                                      Expanded(
                                                        child: TextFormField(
                                                          keyboardType: TextInputType.number,
                                                          controller: tfphone,
                                                          decoration: customInputDecoration(
                                                            Filcolorr: Colors.white,
                                                            colorr: Colors.white,
                                                            prefixIcon: Icons.phone_outlined,
                                                            hintText: "Telefon",
                                                            hintStyle: TextStyle(
                                                              color: Colors.grey[600],
                                                            ),
                                                          ),
                                                          validator:(value){
                                                            if(value!.isEmpty){
                                                              return "Lütfen Telefon Numaranızı Giriniz";
                                                            }
                                                            if (_selectedCountryCode=='+90'&&value.isNotEmpty && value[0] != '5') {
                                                              return "Geçersiz numara";
                                                            }

                                                            if (value.length != 10) {
                                                              return "Telefon Numarası 10 Karakterdir";
                                                            }
                                                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                                              return "Sadece Rakam Girilmelidir"; // Harf veya özel karakter kontrolü
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            ),
                                            ],
                                          ),
                                        ),
                                        CustomButton(
                                          text: "Kodu Gönder",
                                          backgroundColor: Colors.white38,
                                          textColor: Colors.white,
                                          borderRadius: 30,
                                          fontSize: 16,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 2),
                                          onPressed: () {
                                            if (formKey1.currentState!
                                                .validate()) {//formkey texfield kontrol
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text("Başarılı"),
                                                    content: Text(
                                                      "Kod başarıyla gönderildi!\nGelen kodu yazarak yeni şifreyi belirleyiniz",
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Tamam"),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                          print("kullanıcının kodu yazması bekleniyor");
                                                        },
                                                      ),

                                                    ],

                                                  );

                                                },

                                              );
                                              String kullanici =
                                                  tfKullanici.text;
                                              String mail =
                                              tfmail.text;
                                              String telefon =
                                              tfphone.text;
                                              print(
                                                  "Kullanıcı Adı: $kullanici, mail:$mail, telefon:$telefon");
                                              print("Kod Gönderiliyor");

                                            }

                                            else {ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "Lütfen kullanıcı adı, e-posta veya telefonunuzu giriniz!"),
                                                  duration:
                                                  Duration(seconds: 5),
                                                  backgroundColor:
                                                  Colors.deepPurpleAccent,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Form(
                            key: formKey2,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(

                                width: 400,
                                height: 200,
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo.withOpacity(0.4), // Container arkaplan opaklık
                                      blurRadius: 16.0,
                                      offset: Offset(0, 7),//golge boyutu
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: tfKod,
                                        //baslangicoop sayfasından inputdecoratiın
                                        decoration: customInputDecoration(
                                          Filcolorr: Colors.white,
                                          colorr: Colors.white,
                                          prefixIcon: Icons.code, // Name simgesi başa eklenir
                                          hintText: "Kod",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[600], // HintText rengi
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Kod boş olamaz";
                                          }
                                          if(value.length!=6){
                                            return "Kod & Haneli Olmalıdır.";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Spacer(),
                                    //baslangicoop button
                                    CustomButton(
                                      text: "Şifreyi Değiştir",
                                      onPressed: () {
                                        if (formKey2.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Başarılı"),
                                                content: Text("Kod Alındı!"),
                                                actions: [
                                                  TextButton(
                                                    child: Text("Tamam"),
                                                    onPressed: () {
                                                      print("sifre değiştirme sayfasına yonendiriliyor");
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SifreUnutmaKod(),));
                                                      // Dialogu kapatır
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          String kod = tfKod.text;
                                          print("Girilen Kod: $kod");

                                        }
                                        if (tfKod.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text("Kodu doldurunuz!"),
                                              duration: Duration(seconds: 2),
                                              backgroundColor: Colors.deepPurpleAccent,
                                            ),
                                          );
                                        }
                                      },
                                      backgroundColor: Colors.white38,
                                      textColor: Colors.white,
                                      borderRadius: 30,
                                      fontSize: 16,
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Hesabın Yok Mu?",
                                style: TextStyle(
                                  fontFamily: "Rowdies",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Yeni Hesap Oluştur Sayfasına yönlendiriliyor");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  baslangicSingup(),
                                  ));
                                },
                                child: Text("Yeni Hesap Oluştur",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
