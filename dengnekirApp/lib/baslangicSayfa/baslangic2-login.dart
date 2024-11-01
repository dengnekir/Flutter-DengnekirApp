import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../MainSayfa/AnaSayfa.dart';
import 'baslangic2-sifreunutma.dart';
import 'baslangic3-singup.dart';
import 'baslangicOop.dart';

class baslangicLogin extends StatefulWidget {
  @override
  _baslangicLoginState createState() => _baslangicLoginState();
}

class _baslangicLoginState extends State<baslangicLogin> {
  final formkey = GlobalKey<FormState>();
  final tfname = TextEditingController();
  final tfpassword = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'image/1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.07),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Rowdies",
                                fontSize: screenWidth * 0.09,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: tfname,
                                  decoration: customInputDecoration(
                                    Filcolorr: Colors.transparent,
                                    colorr: Colors.white,
                                    suffixIcon: Icons.person,
                                    hintText: "Kullanıcı Adı",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    hasError: hasError,
                                  ),
                                  validator: (tfgirdisi) {
                                    if (tfgirdisi!.isEmpty) {
                                      setState(() => hasError = true);
                                      return "Kullanıcı Adınızı Giriniz";
                                    }

                                    final regex = RegExp(r'[!?\^+%&/|-]');
                                    if (regex.hasMatch(tfgirdisi)) {
                                      setState(() => hasError = true);
                                      return "Kullanıcı adınızda ! ? ' ^ + % & / - | karakterler olmamalı";
                                    }

                                    setState(() => hasError = false);
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      hasError = RegExp(r'[!?\^+%&/|-]').hasMatch(value);
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      style: TextStyle(color: Colors.white),
                                      controller: tfpassword,
                                      decoration: customInputDecoration(
                                        Filcolorr: Colors.transparent,
                                        colorr: Colors.white,
                                        suffixIcon: Icons.key,
                                        hintText: "Şifre Giriniz",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        hasError: hasError, // Hata durumunu geçiriyoruz
                                      ),
                                      obscureText: true,
                                      validator: (tfgirdisi) {
                                        if (tfgirdisi == null || tfgirdisi.isEmpty) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Lütfen Şifre Giriniz";
                                        }
                                        if (tfgirdisi.length < 6) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre 6 Karakterden Küçük Olamaz";
                                        }
                                        bool hasUpperCase = tfgirdisi.contains(RegExp(r'[A-Z]'));
                                        bool hasLowerCase = tfgirdisi.contains(RegExp(r'[a-z]'));
                                        bool hasDigit = tfgirdisi.contains(RegExp(r'[0-9]'));

                                        if (!hasUpperCase) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir büyük harf içermelidir";
                                        }
                                        if (!hasLowerCase) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir küçük harf içermelidir";
                                        }
                                        if (!hasDigit) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir rakam içermelidir";
                                        }
                                        setState(() => hasError = false); // Hata yoksa hasError'ı false yap
                                        return null; // Geçerli şifre
                                      },
                                    ),

                                  )

                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0.05),
                                  child: SizedBox(
                                    width: screenWidth * 1.1,
                                    child: CustomButton(
                                      text: "Giriş Yap",
                                      onPressed: () {
                                        bool kontrolsonucu = formkey.currentState!.validate();
                                        if (kontrolsonucu) {
                                          String name = tfname.text;
                                          String pasw = tfpassword.text;
                                          print("Kullanıcı Adı:$name ve Şifresi $pasw");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MainSayfa(),
                                            ),
                                          );
                                        }
                                      },
                                      backgroundColor: Colors.teal,
                                      textColor: Colors.white,
                                      borderColor: Colors.black87,
                                      elevation: 5,
                                      borderRadius: 10,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => sifreYenileme(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Şifremi unuttum",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => baslangicSingup(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Kayıt Ol",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.04,
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
