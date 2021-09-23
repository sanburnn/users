import 'package:flutter/material.dart';

class Histori extends StatefulWidget {
  const Histori({Key key}) : super(key: key);

  @override
  _HistoriState createState() => _HistoriState();
}

class _HistoriState extends State<Histori> {
  List<Histori> historyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Peminjaman'),
        ),
        body: SafeArea(
            child: Center(
                child: Container(
                    child: ListView(
          children: [list('bulpoint', '2020', 'berhasil')],
        )))));
  }

  Widget list(String judul, String dateTime, String ket) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
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
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          Text(dateTime),
          SizedBox(height: 15),
          Text(ket),
          Divider()
        ],
      ),
    );
  }
}
