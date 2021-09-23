import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:users/controller/homeController.dart';
import 'package:http/http.dart' as http;

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

      print(nama);
      setState(() {});
    });
  }

  final namaController = TextEditingController();
  final jumlahPinjamController = TextEditingController();
  final tanggalPinjamController = TextEditingController();
  final datePinjamController = TextEditingController();
  final tanggalKembaliController = TextEditingController();
  final dateKembaliController = TextEditingController();

  addPinjam() async {
    String nama = namaController.text;
    String jumlahPinjam = jumlahPinjamController.text;
    String tanggalPinjam = datePinjamController.text;
    String tanggalKembali = dateKembaliController.text;

    if (nama == '' ||
        int.parse(jumlahPinjam) >= int.parse(stok) ||
        jumlahPinjam == '' ||
        tanggalPinjam == '' ||
        tanggalKembali == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.addPinjam(context, '1', widget.idBarang, idKategori, nama,
          jumlahPinjam, tanggalKembali);
      namaController.text = '';
      jumlahPinjamController.text = '';
      tanggalPinjamController.text = '';
      tanggalKembaliController.text = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Form Peminjaman'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(nama),
                  subtitle: Text(stok),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: tanggalPinjamController,
                    decoration: InputDecoration(
                      hintText: "Tanggal Peminjaman",
                      labelText: "Tanggal Peminjaman",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                textAlign: TextAlign.left,
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  tanggalPinjamController.text = formattedDate;
                  DateTime datetime = DateTime.parse(formattedDate);
                  datePinjamController.text = datetime.toString();
                },
              ),
            ),
            Container(
              
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                
                controller: tanggalKembaliController,
                decoration: InputDecoration(
                      hintText: "Tanggal Pengembalian",
                      labelText: "Tanggal Pengembalian",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                textAlign: TextAlign.left,
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  tanggalKembaliController.text = formattedDate;
                  DateTime datetime = DateTime.parse(formattedDate);
                  dateKembaliController.text = datetime.toString();
                },
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: jumlahPinjamController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "jumlah Terpinjam",
                      labelText: "jumlah Barang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF838C8A)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  onPressed: () => addPinjam(),
                  child: Text('simpan'),
                ))
          ],
        ),
      ),
    );
  }
}
