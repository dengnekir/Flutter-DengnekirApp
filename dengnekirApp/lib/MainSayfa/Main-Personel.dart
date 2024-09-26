import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Personel extends StatefulWidget {

  @override
  State<Personel> createState() => _PersonelState();
}

class _PersonelState extends State<Personel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      //genel row
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            //kullanıcı adı ve resim
            Column(
              children: [
                //kullanıcı adı kısmı
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //kullanıcı adı
                      TextButton(
                          onPressed: (){
                            print("Kullanıcı adına basıldı");
                          },
                          child: Text("dengnekir",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ),

                      //bildirim ve scenekler kısmı
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          // Tıklandığında yapılacak işlemler
                          print("Bildirimler butonuna basıldı");
                        },
                        icon: Icon(Icons.notifications), // Icon widget'ı içinde kullanmalısınız
                      ),
                      IconButton(
                        onPressed: () {
                          // Tıklandığında yapılacak işlemler
                          print("menu butonuna basıldı");
                        },
                        icon: Icon(Icons.menu), // Icon widget'ı içinde kullanmalısınız
                      ),
                    ],
                  ),
                ),
                //resim kısmı
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.asset(
                        "image/imagemainpersonel/background-personel.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Üstüne eklemek istediğimiz yuvarlak resim
                    Positioned(
                      top: (MediaQuery.of(context).size.height * 0.15) / 2 - 40, // Resmin yüksekliğinin yarısından resmin yarı yüksekliğini çıkarıyoruz
                      left: MediaQuery.of(context).size.width / 15, // Ortalamak için genişliğin yarısından resmin yarı genişliğini çıkarıyoruz
                      child: ClipOval(
                        child: Container(
                          width: 80, // Yuvarlak resmin genişliği
                          height: 80, // Yuvarlak resmin yüksekliği
                          child: Image.asset(
                            'image/2SifreYenileme.png', // Eklemek istediğiniz ikinci resmin yolu
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            //isim ve yazılar
            Row(
              children: [
                //isim
                Column(),
                //takipçi sayisi
                Column(),
              ],
            ),
            //profili duzenle kısmı
            Column(
              children: [
                //profil ai
                Row(),
                //ızgara gorunumu
                Row(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
