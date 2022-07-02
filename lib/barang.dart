import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/model/barangModel.dart';
import 'package:users/provider/barang_prov.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Barangs())],
      child: Consumer<Barangs>(builder: (context, barangprov, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Daftar Barang"),
          ),
          body: barangprov.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Color(0xFF37AEEE),
                  //801E48FF
                ))
              : ListView.builder(
                  itemCount: barangprov.allbarang.length,
                  itemBuilder: (context, i) {
                    Datum data = barangprov.allbarang[i];
                    return Container(
                      height: 100,
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
                              image: AssetImage("assets/images/barang.png"),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  data.nama,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff909090),
                                )
                              ],
                            ),
                            subtitle: Text(
                              "stok : " + data.stok,
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff6CB663)),
                            ),
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => PinjamForm(
                            //           idBarang: "caribarang[i]"),
                            //     ))),
                          ),
                        ),
                      ),
                    );
                  }),
        );
      }),
    );
  }
}
