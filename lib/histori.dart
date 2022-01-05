import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          backgroundColor: Colors.white,
          elevation: 3,
          title: Center(
            child: Text(
              'Histori',
              style: TextStyle(color: Colors.black),
            ),
          ),
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
                                        var tanggalkembali =
                                            DateFormat('dd-MM-yyyy').format(
                                                snapshot.data.data[index]
                                                    .tanggalKembali
                                                    .toLocal());
                                        var tanggalpinjam =
                                            DateFormat('dd-MM-yyyy').format(
                                                snapshot.data.data[index]
                                                    .tanggalPinjam
                                                    .toLocal());
                                        Datum riwayat =
                                            snapshot.data.data[index];
                                        return list(
                                            riwayat.nama,
                                            riwayat.jumlah,
                                            tanggalkembali,
                                            tanggalpinjam,
                                            riwayat.statusTransaksi);
                                      });
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      ),
                    )))));
  }

  Widget list(String judul, String jumlah, String ket, String tanggalpinjam,
      String tanggalkembali) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5.0,
              )
            ]),
        child: Container(
          height: 185,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      judul,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      ket == "0"
                          ? "di proses"
                          : ket == "1"
                              ? "Berhasil"
                              : ket == "2"
                                  ? "Sudah dikembalikan"
                                  : "ditolak",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Divider(
                height: 10,
                thickness: 3,
                color: Colors.grey.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child:
                              Text("Jika ada Masalah Segera Lapor ke penjaga")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Jumlah  : " + jumlah,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "Tanggal Pinjam",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(tanggalpinjam),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "Tanggal Kembali",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(tanggalpinjam),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
