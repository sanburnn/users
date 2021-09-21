import 'package:flutter/material.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/model/barangModel.dart';
import 'package:users/pinjam.dart';
import 'package:users/theme.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  final con = HomeController();

  @override
  void initState() {
    super.initState();
    con.getBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Barang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () async {
            con.getBarang();
          },
          child: StreamBuilder<BarangModel>(
              stream: con.resBarang.stream,
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
                          Datum barang = snapshot.data.data[index];
                          return list(
                              barang.idBarang, barang.nama, barang.stok);
                        });
                  }
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  Widget list(String idBarang, String nama, String stok) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
          side: BorderSide(color: Colors.grey, width: 2)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              title: Text(
                nama,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                stok,
                style: TextStyle(fontSize: 15),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinjamForm(idBarang: idBarang),
                  ))),
        ),
      ),
    );
  }
}
