
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
    return Scaffold(
      body: Center(
        child:
            Stack(//image ustune eklenen widgets

              children: [
                Positioned.fill(
                  child:
                    Image.asset('image/1.png',
                    fit: BoxFit.fill,//image tüm ekrana doldurma işlemi
                    ),
                ),
                Positioned(//6.4> inç ekranlar için yuksekten ayarlama
                  left: 0,
                  right: 0,
                  top: 150,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //LOGO AND LOGO STYLE
                        SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset("image/logo.png")
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        //APP NAME AND NAME STYLE
                        Text("Vistopia",
                        style:
                        TextStyle(
                            fontFamily: 'Margarine',
                            fontSize: 70,
                            color: Colors.black87,
                        ),
                        ),
                        //AÇIKLAMA
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 35),
                          child: Text("Senin Yolculuğun, Senin Hikayen",
                          style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                        ),
                        //AÇIKLAMA 2 AND AÇIKLAMA FONTFAMİLY
                        Text("Hoşgeldin",
                          style:
                          TextStyle(
                            fontFamily: "Rowdies",
                            fontSize: 50,
                            color: Colors.black87,
                          ),
                        ),
                        //AÇIKLAMA 3
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 45),
                          child: Text("Hazır mısın?",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        //BUTTON
                        SizedBox(
                          width: 150,//Button genişliği
                          //baslangicoop button
                          child: CustomButton(
                            text: "İleri",
                            onPressed: () {
                              print("login ekrana geçiliyor");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => baslangicLogin()),
                              );
                            },
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            borderColor: Colors.black87,
                            elevation: 5,
                            borderRadius: 30,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                ),
        ],
            ),
        ),

    );
  }
}
