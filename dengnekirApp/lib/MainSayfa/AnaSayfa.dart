
import 'package:dengnekirapp/baslangicSayfa/baslangic2-login.dart';
import 'package:dengnekirapp/baslangicSayfa/baslangicOop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainSayfa());
}

class MainSayfa extends StatelessWidget {
  const MainSayfa({super.key});

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
        child:Text("sa")

      ),

    );
  }
}
