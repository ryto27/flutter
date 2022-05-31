import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:state_set/state_set.dart';

TextEditingController _controllerNim = TextEditingController();
TextEditingController _controllerNama = TextEditingController();
TextEditingController _controllerkelas = TextEditingController();
TextEditingController _controllerjurusan = TextEditingController();
GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
Dio dio = new Dio();
List<Mahasiswa> listMahasiswa = [];

class ViewJson extends StatefulWidget {
  const ViewJson({Key? key}) : super(key: key);

  @override
  _ViewJsonState createState() => _ViewJsonState();

  Future<void> getMahasiswa() async {
    Response response;

    response =
        await dio.get("http://127.0.0.1/api-mahasiswa/list_mahasiswa.php");

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

  Future<void> insertMahasiswa() async {
    Response response;
    response = await dio
        .post("http://127.0.0.1/api-mahasiswa/list_mahasiswa.php", data: {
      "nim": "${_controllerNim.text}",
      "nama": "${_controllerNama.text}",
      "kelas": "${_controllerkelas.text}",
      "jurusan": "${_controllerjurusan.text}",
    });
    if (response.data['status'] == 1) {
      _scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Berhasildisimpan")));
      setState(() {
        _controllerNim.text = "";
        _controllerNama.text = "";
        _controllerkelas.text = "";
        _controllerjurusan.text = "";
        getMahasiswa();
      });
    }
  }
}

class _ViewJsonState extends State<ViewJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Parsing Json"),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Text("Form Input"),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: TextField(
                  controller: _controllerNim,
                  decoration: InputDecoration(hintText: "Nim"),
                )),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: TextField(
                  controller: _controllerkelas,
                  decoration: InputDecoration(hintText: "kelas"),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: TextField(
                  controller: _controllerNama,
                  decoration: InputDecoration(hintText: "Nama Mhs"),
                )),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: TextField(
                  controller: _controllerjurusan,
                  decoration: InputDecoration(hintText: "Jurusan"),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                ViewJson().insertMahasiswa();
              },
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 29,
            ),
            Text("Data Mahasiswa"),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            listMahasiswa.length == null
                ? Center(
                    child: Text("Data Kosong"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: listMahasiswa.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nim Mhs"),
                                Text(listMahasiswa[i].nim),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama Mhs"),
                                Text(listMahasiswa[i].nama),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Kelas Mhs"),
                                Text(listMahasiswa[i].kelas),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jurusan Mhs"),
                                Text(listMahasiswa[i].jurusan),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}

class Mahasiswa {
  final String nim;
  final String nama;
  final String kelas;
  final String jurusan;
  Mahasiswa(
      {this.nim = "", this.nama = "", this.kelas = "", this.jurusan = ""});
}
