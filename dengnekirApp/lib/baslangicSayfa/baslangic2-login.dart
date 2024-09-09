import 'package:dengnekirapp/baslangicSayfa/baslangic2-sifreunutma.dart';
import 'package:dengnekirapp/baslangicSayfa/baslangic3-singup.dart';
import 'package:dengnekirapp/baslangicSayfa/baslangicOop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class baslangicLogin extends StatelessWidget {
var formkey=GlobalKey<FormState>();//key anahtarı
var tfname=TextEditingController();//kullanıcı işlemleri
var tfpassword=TextEditingController();//sifre islemleri
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //6.4< inç ekranlar için kaydırma butonu
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
          width: MediaQuery.of(context).size.width,
          child: Center(
            child:
                //İMAGE USTUNE WİDGET
            Stack(
              children: [
                Positioned.fill(
                  child:
                  Image.asset('image/2.png',
                    fit: BoxFit.fill,
                  ),
                ),
                //LOGO
                Positioned(
                  left: 0,
                  right: 0,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child:SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.asset("image/logo.png")
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 200.0), // Formun yukarıdan 00 piksel aşağıya inmesini sağlar
                    Text("Merhaba"
                    ,style: TextStyle(
                        fontFamily: "Rowdies",
                        fontSize: 30,
                      ),
                    ),
                    Text("Devam Etmek İçin Oturum Açınız"),
                    //FORM İŞLEMLERİ LOGİN
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: tfname,
                                    //BASLANGİC.OOP.DART
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.white,
                                      colorr: Colors.purple,
                                      prefixIcon:Icons.alternate_email, // name simgesi başa eklenir
                                      hintText: "Kullanıcı Adı",
                                    ),
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Kullanıcı Adınızı Giriniz";
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0,bottom: 5.0),
                                    child: TextFormField(
                                      controller: tfpassword,
                                      decoration: customInputDecoration(
                                        Filcolorr: Colors.white,
                                        colorr: Colors.purple,
                                        prefixIcon: Icons.lock, // password simgesi başa eklenir
                                        hintText: "Şifre Giriniz",
                                      ),
                                      obscureText: true,
                                      validator:(tfgirdisi){
                                        if(tfgirdisi!.isEmpty){
                                          return "Lütfen Şifre Giriniz";
                                        }
                                        if(tfgirdisi!.length<6){
                                          return "Şifre 6 Karakterden Küçük Olamaz";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //SİFRE UNUTMA
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)
                                        => sifreYenileme(),
                                        ));
                                        print("Şifre değiştirme ekranına yonlendiriliyor");
                                      },
                                      child: Text("Şifremi unuttum"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    //GİRİŞ BUTONU KONTROL KISMI
                                    child:CustomButton(
                                        text: "Giriş",
                                        onPressed:(){
                                          //key anahtarları buraya gelir ve doğrulama işlemleri olur
                                          //yani karakter uzunluğu 6 yı geciyor mu mesela
                                          print("Anasayfaya Geçiş izni kontrol ediliyor");
                                          bool kontrolsonucu=formkey.currentState!.validate();//TEXTFİELD KONTROL
                                          if(kontrolsonucu){
                                            String name=tfname.text;
                                            String pasw=tfpassword.text;
                                            print("Kullanıcı Adı:$name ve Şifresi $pasw");
                                          }
                                        },
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        borderColor: Colors.black87,
                                        elevation: 5,
                                        borderRadius: 30,
                                      ),

                                  ),
                                  Text("Hesabınız Yok Mu?",style: TextStyle(
                                    color: Colors.black,
                                  ),),
                                  //baslangicoop button
                                  CustomButton(
                                    text: "Kayıt Ol!",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => baslangicSingup()),
                                      );
                                      print("Sign Up Ekranına Geçiş Yapıldı");
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
