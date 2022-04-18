import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menampilkan Gambar"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Image.asset("images/expresso.jpeg"),
            Image.network(
                "https://cdns.klimg.com/merdeka.com/i/w/news/2020/04/18/1168249/670x335/resep-kopi-tarik-minuman-kekinian-yang-mudah-dibuat-di-rumah.jpg")
          ],
        )),
      ),
    );
  }
}
