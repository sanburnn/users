import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';

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

    //Return String
    String idUser;
    String stringValue = prefs.getString(idUser);
    return stringValue;
  }

  @override
  void initState() {
    super.initState();
    con.getRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Peminjaman'),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        con.getRiwayat();
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
          Text('Jumlah Stok $jumlah'),
          SizedBox(height: 15),
          Text(ket == "1" ? "Pengajuan di proses" : "Pengajuan di Tolak"),
          Divider(),
        ],
      ),
    );
  }
}
