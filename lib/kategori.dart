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
  List<Datum> barang = <Datum>[];
  List<Datum> caribarang;

  @override
  void initState() {
    super.initState();
    con.getBarang();
    con.resBarang.listen((value) {
      if (mounted)
        setState(() {
          if (barang.isNotEmpty) {
            if (mounted)
              setState(() {
                barang.clear();
              });
          } else {
            barang.addAll(value.data);
            caribarang = barang;
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView(children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            height: 105,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "HELLO USERS",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffBC9CFF)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Yuk Cari barang yang ingin di pinjam !",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  hintText: "Search Sampah",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400])),
              onChanged: (value) {
                setState(() {
                  caribarang = barang.where((element) {
                    var namaSampah = element.nama.toLowerCase();
                    return namaSampah.contains(value);
                  }).toList();
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: caribarang == null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(top: 8),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext con, _) => Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 12),
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 8, top: 8, left: 8),
                                          height: 10,
                                          width: 150,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 8, left: 8),
                                          height: 10,
                                          width: 200,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8),
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: 7,
                            ),
                          ),
                        ],
                      ))
                  : list()),
        ]),
      ),
    );
  }

  Widget list() {
    return Container(
        height: 50,
        padding: EdgeInsets.only(bottom: 60),
        child: caribarang.isEmpty
            ? Center()
            : ListView.builder(
                itemCount: caribarang.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 85,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      color: Color(0xffE7DCFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            leading: Image(
                              image: AssetImage("assets/images/atk.png"),
                            ),
                            title: Text(
                              caribarang[i].nama,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              "stok : " + caribarang[i].stok,
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff6CB663)),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PinjamForm(
                                      idBarang: caribarang[i].idBarang),
                                ))),
                      ),
                    ),
                  );
                }));
  }
}
