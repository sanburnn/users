import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/theme.dart';

import 'model/historiModel.dart';

class Histori extends StatefulWidget {
  const Histori({Key key}) : super(key: key);

  @override
  _HistoriState createState() => _HistoriState();
}

class _HistoriState extends State<Histori> {
  final con = HomeController();
  List<Histori> historyList = [];

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token');
    con.getRiwayat(token);
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Peminjaman'),
          leading: Container(),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        getPref();
                      },
                      child: Container(
                        child: StreamBuilder<HistoriModel>(
                            stream: con.resHistori.stream,
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.data == null) {
                                  return Center(
                                    child: Text('Data kosong '),
                                  );
                                } else {
                                  return ListView.builder(
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder: (context, index) {
                                        Datum riwayat =
                                            snapshot.data.data[index];
                                        return list(
                                            riwayat.nama,
                                            riwayat.jumlah,
                                            riwayat.statusTransaksi);
                                      });
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      ),
                    )))));
  }

  Widget list(String judul, String jumlah, String ket) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                judul,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Text('Jumlah yang di pinjam : $jumlah'),
          SizedBox(height: 15),
          Text(
            ket == '0' ? 'Pengajuan Masih di proses' : 'Peminjaman berhasil',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Divider(),
        ],
      ),
    );
  }
}
