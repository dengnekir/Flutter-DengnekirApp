import 'package:dengnekirapp/baslangicSayfa/baslangic2-login.dart';
import 'package:dengnekirapp/baslangicSayfa/baslangicOop.dart';
import 'package:dengnekirapp/baslangicSayfa/kod-onaylama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class baslangicSingup extends StatefulWidget {

  @override

  State<baslangicSingup> createState() => _baslangicSingupstate();
}

class _baslangicSingupstate extends State<baslangicSingup> {

  var formkey=GlobalKey<FormState>();//key anahtarı
  var tfname=TextEditingController();//kullanıcı işlemleri
  var tfpassword=TextEditingController();//sifre islemleri
  var tfbirthday=TextEditingController();//doğum günü işlemleri
  var tfMail = TextEditingController();
  var tfPhone = TextEditingController();


  String? _selectedCountryCode = '+90'; // Varsayılan ülke kodu
  //PASSWORD İŞLEMLERİ OBSURECURT
  bool _isObscure = true; // Başlangıçta şifre gizli olacak
  //ULKE KODU SEARCH KISMI
  void _navigateToCountryCodeSearch() async {
    final selectedCode = await Navigator.push(//SECİLECEK KOD
      context,
      MaterialPageRoute(builder: (context) => CountryCodeSearch()),//BASLANGICOOP.DART SAYFASINA GİDER ARAMA KISMI
    );
//VARSAYILAN KOD BU OLACAK
    if (selectedCode != null) {
      setState(() {
        print("Seçilen Ülke Kodumuz: $selectedCode");
        _selectedCountryCode = selectedCode; // YENİ VARSAYILAN VE SECİLEN KOD AKTARIMI
      });
    }
  }
  //birtdayy
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),//varsayılan tarih.
      firstDate: DateTime(1950),//secilebilecek en eski tarih
      lastDate: DateTime.now(),//secilebilecek en geç tarih
    );
    if (picked != null) {
      setState(() {
        tfbirthday.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
          width: MediaQuery.of(context).size.width,
          child: Center(
            child:
            Stack(
              children: [
                Positioned.fill(
                  child:
                  Image.asset('image/3.png',
                    fit: BoxFit.cover,
                  ),
                ),

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: Text("Yeni Hesap",
                              style: TextStyle(
                                fontFamily: "Rowdies",
                                fontSize: 55
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("K a y ı t   O l"),
                            ),
                            //LOGO
                            Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                  height: 220,
                                  width: 220,
                                  child: Image.asset("image/logo.png")),
                            ),
                          ],
                        ),
                          ],
                        ),
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:40.0,right: 40.0,left: 40.0),
                        child: Form(
                          key: formkey,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                //KULLANICI ADI
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                                  child: TextFormField(
                                    cursorColor: Colors.black,//yazılırkenki cursor rengi
                                    controller: tfname,
                                    decoration: customInputDecoration(
                                      colorr: Colors.purple,
                                      Filcolorr: Colors.transparent,//arkaplan rengi
                                      prefixIcon: Icons.person, // name simgesi başa eklenir
                                      hintText: "Kullanıcı Adı",
                                    ),
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Kullanıcı Adınızı Giriniz";
                                      }
                                      if(tfgirdisi.length>15){
                                        return "Kullanıcı Adı 15 Karakterden Uzun Olamaz";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //PASSWORD
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  //PASSWORD
                                  child: TextFormField(
                                    controller: tfpassword,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.transparent,
                                      colorr: Colors.purple,
                                      //şifre gorunur yapma kapatma
                                      passwordd: IconButton(
                                        icon:Icon(
                                          _isObscure ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ) ,
                                      onPressed: () {
                                    setState(() {
                                    _isObscure = !_isObscure; // Şifre görünürlüğünü değiştir
                                    });
                                    },
                                      ),
                                      prefixIcon: Icons.lock, // password simgesi başa eklenir
                                      hintText: "Şifre Giriniz",
                                    ),
                                    obscureText: _isObscure,//sifre gorunur veya gorunmez yapma
                                    validator:(tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Lütfen Şifre Giriniz";
                                      }
                                      if(tfgirdisi!.length<6){
                                        return "Şifre 6 Karakterden Küçük Olamaz";
                                      }
                                      bool hasUpperCase = tfgirdisi.contains(RegExp(r'[A-Z]'));
                                      bool hasLowerCase = tfgirdisi.contains(RegExp(r'[a-z]'));
                                      bool hasDigit = tfgirdisi.contains(RegExp(r'[0-9]'));

                                      if (!hasUpperCase) {
                                        return "Şifre en az bir büyük harf içermelidir";
                                      }
                                      if (!hasLowerCase) {
                                        return "Şifre en az bir küçük harf içermelidir";
                                      }
                                      if (!hasDigit) {
                                        return "Şifre en az bir rakam içermelidir";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //EMAİL
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  //E MAİL
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: tfMail,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.white,
                                      colorr: Colors.purple,
                                      prefixIcon: Icons.alternate_email, // email simgesi başa eklenir
                                      hintText: "E-Mail Giriniz",
                                    ),
                                    validator:(tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Lütfen Email Giriniz";
                                      }
                                      if(!tfgirdisi.contains("@")){
                                        return "Lütfen Geçerli Bir E-Mail Adresi Giriniz";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //BİRTDAY
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                                  child: TextFormField(
                                    cursorColor: Colors.black,//yazılırkenki cursor rengi
                                    controller: tfbirthday,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.white,//arkaplan rengi
                                      colorr: Colors.purple,//error color
                                      prefixIcon: Icons.calendar_month, // name simgesi başa eklenir
                                      hintText: "Doğum Tarihiniz",
                                    ),
                                      validator:(tfgirdisi) {
                                        if (tfgirdisi!.isEmpty) {
                                          return "Lütfen Doğum Tarihini Giriniz";
                                        }
                                        return null;
                                      },
                                    onTap: () {
                                      // Klavyeyi kapatmak için.
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      _selectDate(context);
                                    },
                                  ),
                                ),
                                //telefon
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
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
                                            //VARSAYILAN VE GOSTERİLEN KOD
                                            _selectedCountryCode ?? 'Henüz ülke kodu seçilmedi',
                                            style: TextStyle(fontSize: 20,color: Colors.grey),


                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 3.0), // Dropdown ile TextField arasındaki boşluk
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: tfPhone,
                                          decoration: customInputDecoration(
                                            Filcolorr: Colors.white,//arkaplan rengi
                                            colorr: Colors.purple,//error rengi
                                            prefixIcon: Icons.phone_outlined,
                                            hintText: "Telefon",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          validator:(tfgirdisi){
                                            if(tfgirdisi!.isEmpty){
                                              return "Telefon Numaranızı Giriniz";
                                            }
                                            if (_selectedCountryCode=='+90'&&tfgirdisi.isNotEmpty && tfgirdisi[0] != '5' ) {
                                              return "Geçersiz numara";
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    //baslangicoop button
                                    child: CustomButton(
                                    text: "Kayıt OL",
                                      onPressed:(){
                                        //key anahtarları buraya gelir ve doğrulama işlemleri olur
                                        //yani karakter uzunluğu 6 yı geciyor mu mesela
                                        print("Anasayfaya Geçiş izni kontrol ediliyor");
                                        bool kontrolsonucu=formkey.currentState!.validate();//TEXTFİELD KONTROL
                                        if(kontrolsonucu){
                                          String name=tfname.text;
                                          String pasw=tfpassword.text;
                                          String mail=tfMail.text;//onay sayfasına gider
                                          String phone=tfPhone.text;//onay sayfasına gider
                                          print("Kullanıcı Adı:$name ve Şifresi $pasw dir. Email:$mail ve Numarası:$phone dir");
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                              kodOnaylama(
                                                //diğer sayfaya yonlendirme
                                                data: VerificationData(email: mail, phoneNumber: phone,userName: name),//onay sayfasına gidiyor
                                              ),
                                          ));
                                        }

                                      },
                                      backgroundColor: Colors.purpleAccent,
                                      textColor: Colors.white70,
                                      borderColor: Colors.black87,
                                      elevation: 5,
                                      borderRadius: 30,
                                      ),),


                                ),
                                Text("Hesabın mı Var!",style: TextStyle(
                                  color: Colors.black,
                                ),),
                                //baslangicoop button
                                CustomButton(
                                  text: "Giriş Yap",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => baslangicLogin()),
                                    );
                                    print("Kayıt Ol ekranına geri dönüldü");
                                  },
                                  backgroundColor: Colors.transparent,
                                  textColor: Colors.black,
                                  borderRadius: 30,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
