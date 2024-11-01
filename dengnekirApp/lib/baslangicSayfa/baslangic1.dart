
import 'package:Vistopia/baslangicSayfa/baslangic3-singup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'baslangic2-login.dart';
import 'baslangicOop.dart';

void main() {
  runApp(const MyDengnekirApp());
}

class MyDengnekirApp extends StatelessWidget {
  const MyDengnekirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengnekir',//çalıştırılmadı appbar yok
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Dengnekir'),//appbar yok çalıştırılmadı
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child:
        Stack(//image ustune eklenen widgets
              
                children: [
                  Positioned(
                    top: 0,
                    child:
                      Image.asset('image/1.png',
                      ),
                  ),
                  Positioned(//6.4> inç ekranlar için yuksekten ayarlama
                    left: 0,
                    right: 0,
                    top: screenHeight*0.2,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //LOGO AND LOGO STYLE
                          SizedBox(
                              height: screenHeight*0.2,
                              width: screenWidth*0.2,
                              child: Image.asset("image/logo.png")
                          ),
                          SizedBox(
                            height: screenHeight*0.01,
                          ),
                          //APP NAME AND NAME STYLE
                          Text("Vistopia",
                          style:
                          TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                          ),
                          ),
                          //AÇIKLAMA
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 35),
                            child: Text("Senin Yolculuğun, Senin Hikayen",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                            ),                         ),
                          ),
                          //BUTTON
                          SizedBox(
                            height: screenHeight*0.2,
                            width: screenWidth*0.7,//Button genişliği
                            //baslangicoop button
                            child: CustomButton(
                              text: "Giriş Yap",
                              onPressed: () {
                                print("login ekrana geçiliyor");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => baslangicLogin()),
                                );
                              },
                              backgroundColor: Colors.teal,
                              textColor: Colors.white,
                              borderColor: Colors.black87,
                              elevation: 1,
                              borderRadius: 10,
                              fontSize: screenWidth*0.05,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.22,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Divider(
                                    color: Colors.white, // Çizgi rengi
                                    thickness: 1,        // Çizgi kalınlığı
                                    indent: 0,           // Soldan boşluk
                                    endIndent: 0,        // Sağdan boşluk
                                  ),
                                  Text(
                                    "Hesabın Yok mu?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 8), // Yazı ile buton arasındaki boşluk
                                  TextButton(
                                      onPressed: () {
                            print("Signup ekrana geçiliyor");
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => baslangicSingup()),
                            );
                            }, child: Text("Kayıt Ol", style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: screenWidth*0.05
                                  ),)),

                                ],
                              ),
                            ),
                          )

                        ],
                      ),
              
                  ),
                  //BUTTON
              
                      ],
              ),

        ),

    );
  }
}
