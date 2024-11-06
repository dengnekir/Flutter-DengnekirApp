import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'baslangicOop.dart';

/////////////////////////////////////////////////KODU ONAYLAMA//////////
class SifreUnutmaKod extends StatefulWidget {
  const SifreUnutmaKod({Key? key}) : super(key: key);

  @override
  State<SifreUnutmaKod> createState() => _SifreUnutmaKodState();
}
var formKey2 = GlobalKey<FormState>(); // Kod ve şifre formu için key
var tfKod = TextEditingController(); // Kod kontrolcüsü
var tfPassword = TextEditingController(); // Şifre onay kontrolcüsü
var tfPassword2 = TextEditingController(); // Şifre mail kontrolcüsü
bool _isObscure = true; // Başlangıçta şifre gizli olacak
bool _isObscure2 = true; // Başlangıçta şifre gizli olacak


class _SifreUnutmaKodState extends State<SifreUnutmaKod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:                    // Kod ve şifre formu
          //gelen kod buraya yazılır
          Center(
            child: Container(
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
                        Text("Şifre Yenileme",
                          style:
                          TextStyle(
                            fontFamily: "Rowdies",
                            fontSize: 50,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Center(
                    child: Form(
                      key: formKey2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(

                                  controller: tfPassword,
                                  obscureText: _isObscure2,//sifre gorunur veya gorunmez yapma

                                  //baslangicoop sayfasından inputdecoratiın
                                  decoration: customInputDecoration(
                                    passwordd: IconButton(
                                      icon:Icon(
                                        _isObscure2 ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ) ,
                                      onPressed: () {
                                        setState(() {
                                          _isObscure2 = !_isObscure2; // Şifre görünürlüğünü değiştir
                                        });
                                      },
                                    ),
                                    Filcolorr: Colors.white,
                                    colorr: Colors.white,
                                    suffixIcon: Icons.password_outlined, // Name simgesi başa eklenir
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

                                  //baslangicoop sayfasından inputdecoratiın
                                  decoration: customInputDecoration(
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
                                    colorr: Colors.white,
                                    Filcolorr: Colors.white,
                                    suffixIcon: Icons.password_outlined, // Name simgesi başa eklenir
                                    hintText: "Şifreyi Onayla",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600], // HintText rengi
                                    ),
                                  ),
                                  obscureText: _isObscure,//sifre gorunur veya gorunmez yapma

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
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainSayfa(),));
                                                // Dialogu kapatır
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
