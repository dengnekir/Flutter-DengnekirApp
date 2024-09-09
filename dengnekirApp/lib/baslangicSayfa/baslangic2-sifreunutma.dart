import 'package:dengnekirapp/baslangicSayfa/baslangic3-singup.dart';
import 'package:dengnekirapp/baslangicSayfa/baslangicOop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class sifreYenileme extends StatefulWidget {

  @override

  State<sifreYenileme> createState() => _sifreyenilemeState();
}

class _sifreyenilemeState extends State<sifreYenileme> {
  var formKey1 = GlobalKey<FormState>(); // Kullanıcı adı formu için key
  var formKey2 = GlobalKey<FormState>(); // Kod ve şifre formu için key
  var tfKullanici = TextEditingController(); // Kullanıcı adı kontrolcüsü
  var tfKod = TextEditingController(); // Kod kontrolcüsü
  var tfPassword = TextEditingController(); // Şifre kontrolcüsü
  var tfPassword2 = TextEditingController(); // Şifre onay kontrolcüsü
  var tfmail = TextEditingController(); // mail kod kontrolcüsü
  var tfphone = TextEditingController(); // telefon kod kontrolcüsü
  String? _selectedCountryCode = '+90'; // Varsayılan ülke kodu
  //KOD SAYFASINA ERİŞİM
  void _navigateToCountryCodeSearch() async {
    final selectedCode = await Navigator.push(//SECİLECEK KOD
      context,
      MaterialPageRoute(builder: (context) => CountryCodeSearch()),
    );

    if (selectedCode != null) {
      setState(() {
        _selectedCountryCode = selectedCode; // SECİLEN KODU VARSAYILAN KOD YAPMA
        print("seçilen ülkemiz:${_selectedCountryCode}");
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
                    Image.asset(
                      'image/2SifreYenileme.png',
                      fit: BoxFit.cover,
                    ),
                    //dengnekir ismi
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Dengnekir",
                          style: TextStyle(
                            fontFamily: "Margarine",
                            fontSize: 30,
                          ),
                        ),
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
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.indigo.withOpacity(0.4),
                                          blurRadius: 16.0,
                                          offset: Offset(0, 7),
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
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Kullanıcı adınızı giriniz";
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
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "E-posta adresinizi giriniz";
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
                                                          validator:(tfgirdisi){
                                                            if(tfgirdisi!.isEmpty){
                                                              return "Lütfen Telefon Numaranızı Giriniz";
                                                            }
                                                            if (tfgirdisi.length != 10) {
                                                              return "Telefon Numarası 10 Karakterdir";
                                                            }
                                                            if (!RegExp(r'^[0-9]+$').hasMatch(tfgirdisi)) {
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
                                                          Navigator.of(context)
                                                              .pop();
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
                                            } else {
                                              ScaffoldMessenger.of(context)
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
                                SizedBox(height: 10), // Araya boşluk ekledim
                                // Kod ve şifre formu
                                //gelen kod buraya yazılır
                                Form(
                                  key: formKey2,
                                  child: Container(
                                    width: 400,
                                    height: 450,
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
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
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
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: tfPassword,
                                            obscureText: true,
                                            //baslangicoop sayfasından inputdecoratiın
                                            decoration: customInputDecoration(
                                              Filcolorr: Colors.white,
                                              colorr: Colors.white,
                                              prefixIcon: Icons.password_outlined, // Name simgesi başa eklenir
                                              hintText: "Şifre",
                                              hintStyle: TextStyle(
                                                color: Colors.grey[600], // HintText rengi
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Şifre boş olamaz";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: tfPassword2,
                                            obscureText: true,//sifre yıldızlı gozuksun
                                            //baslangicoop sayfasından inputdecoratiın
                                            decoration: customInputDecoration(
                                              colorr: Colors.white,
                                              Filcolorr: Colors.white,
                                              prefixIcon: Icons.password_outlined, // Name simgesi başa eklenir
                                              hintText: "Şifreyi Onayla",
                                              hintStyle: TextStyle(
                                                color: Colors.grey[600], // HintText rengi
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Şifre boş olamaz";
                                              }
                                              if (value != tfPassword.text) {
                                                return "Şifreler eşleşmiyor!";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
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
                                                    content: Text("Şifreniz başarıyla değiştirildi!"),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Tamam"),
                                                        onPressed: () {
                                                          Navigator.of(context).pop(); // Dialogu kapatır
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              String kod = tfKod.text;
                                              String sifre = tfPassword.text;
                                              print("Girilen Kod: $kod");
                                              print("Yeni Şifre: $sifre");
                                            }
                                            if (tfKod.text.isEmpty || tfPassword.text.isEmpty || tfPassword2.text.isEmpty) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Lütfen tüm alanları doldurunuz!"),
                                                  duration: Duration(seconds: 2),
                                                  backgroundColor: Colors.deepPurpleAccent,
                                                ),
                                              );
                                            }
                                            if (tfPassword.text != tfPassword2) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Lütfen Şifrelerin Eşleştiğinden Emin Olun!"),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => baslangicSingup()),
                              );
                            },
                            child: Text("Yeni Hesap Oluştur",style: TextStyle(
                              color: Colors.purple
                            ),),
                          ),
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("image/logo.png")),
                        ],
                      ),
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
