import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';
import 'package:http/http.dart' as http;
import 'package:users/histori.dart';
import 'package:users/theme.dart';
import 'package:users/utils/succesPage.dart';

class PinjamForm extends StatefulWidget {
  final String idBarang;
  const PinjamForm({Key key, this.idBarang}) : super(key: key);

  @override
  _PinjamFormState createState() => _PinjamFormState();
}

class _PinjamFormState extends State<PinjamForm> {
  final con = HomeController();

  String nama = '';
  String stok = '';
  String idKategori = '';

  @override
  void initState() {
    super.initState();
    getIdBarang();
  }

  getIdBarang() async {
    con.getIdBarang(widget.idBarang.toString());
    con.resIdBarang.listen((value) {
      nama = value.data.nama;
      stok = value.data.stok;
      idKategori = value.data.idKategori;

      print(widget.idBarang);
      setState(() {});
    });
  }

  final namaController = TextEditingController();
  final jumlahPinjamController = TextEditingController();
  final tanggalPinjamController = TextEditingController();
  final datePinjamController = TextEditingController();
  final tanggalKembaliController = TextEditingController();
  final dateKembaliController = TextEditingController();
  final tokenController = TextEditingController();

  addPinjam() async {
    String nama = namaController.text;
    String jumlahPinjam = jumlahPinjamController.text;
    String tanggalPinjam = datePinjamController.text;
    String tanggalKembali = dateKembaliController.text;

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    if (int.parse(jumlahPinjam) >= int.parse(stok) ||
        jumlahPinjam == '' ||
        tanggalPinjam == '' ||
        tanggalKembali == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.addPinjam(context, "9", widget.idBarang, idKategori, nama,
          jumlahPinjam, tanggalKembali, token);

      namaController.text = '';
      jumlahPinjamController.text = '';
      tanggalPinjamController.text = '';
      tanggalKembaliController.text = '';

      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SuccesPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: -90,
              left: -125,
              child: Container(
                  height: 300,
                  width: 250,
                  child: Transform.translate(
                      offset: Offset(-5.0, 60.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          'assets/images/elipse2.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 70,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 32,
                          color: Color(0xff85d0757),
                        )),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                Center(
                  child: Text(
                    'Form Peminjaman',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Barang yang di Pinjam",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 130),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color(0xffF5F0FF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            nama,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          height: 20,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Stok : " + stok),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            "Jumlah Barang",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 8, left: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xffF5F0FF)),
                          child: TextField(
                            controller: jumlahPinjamController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "jumlah Terpinjam",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Tanggal Pinjam",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 130),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xffF5F0FF),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ]),
                        child: TextField(
                          controller: tanggalPinjamController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            hintText: "2021/12/29",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          textAlign: TextAlign.left,
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 0)),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(date);
                              tanggalPinjamController.text = formattedDate;
                              DateTime datetime = DateTime.parse(formattedDate);
                              datePinjamController.text = datetime.toString();
                            }
                            if (date == null) {
                              Fluttertoast.showToast(
                                  msg: "Tangga Masih Kosong",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Tanggal kembali",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(right: 130),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xffF5F0FF),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ]),
                        child: TextField(
                          controller: tanggalKembaliController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            hintText: "2021/12/29",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          textAlign: TextAlign.left,
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 0)),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(date);
                              tanggalKembaliController.text = formattedDate;
                              DateTime datetime = DateTime.parse(formattedDate);
                              dateKembaliController.text = datetime.toString();
                            }
                            if (date == null) {
                              Fluttertoast.showToast(
                                  msg: "Tangga Masih Kosong",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff665588),
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () => addPinjam(),
                    child: Text('Ajukan'),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ]),
            ),
            Positioned(
              bottom: 200,
              right: -180,
              child: Container(
                  height: 300,
                  width: 250,
                  child: Transform.translate(
                      offset: Offset(-5.0, 60.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          'assets/images/elipse4.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
