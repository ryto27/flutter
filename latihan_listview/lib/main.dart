import 'package:flutter/material.dart';
import 'package:latihan_listview/view_listview.dart';
import 'package:latihan_listview/listview_builder.dart';

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
      //code baru disini
      home: ViewListviewBuilder(),
      //akhir code baru
    );
  }
}
