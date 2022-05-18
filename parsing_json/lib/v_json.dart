import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ViewJson extends StatefulWidget {
  @override
  _ViewJsonState createState() => _ViewJsonState();
}

class _ViewJsonState extends State<ViewJson> {
  Dio dio = new Dio();
  List<Mahasiswa> listMahasiswa = [];
}

class Mahasiswa {
  final String? nim;
  final String? nama;
  final String? kelas;
  final String? jurusan;
  Mahasiswa({this.nim, this.nama, this.kelas, this.jurusan});
}

Future<void> getMahasiswa() async {
  Response response;
  response =
      await Dio().get("http://192.168.156.17/api-mahasiswa/list_mahasiswa.php");
  if (response.data['status'] == 1) {
    setState(() {
      for (int i = 0; i < response.data['info'].length; i++) {
        listMahasiswa.add(Mahasiswa(
          nim: response.data['info']['nim'],
          nama: response.data['info']['nama'],
          kelas: response.data['info']['kelas'],
          jurusan: response.data['info']['jurusan'],
        ));
      }
    });
  }
}
