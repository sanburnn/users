import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:users/api/repostory.dart';
import 'package:users/model/barangIdModel.dart';
import 'package:users/model/barangModel.dart';
import 'package:users/model/historiModel.dart';
import 'package:users/model/kategoriModel.dart';

class HomeController {
  final repostory = Repostory();

  final _barangFetchar = PublishSubject<BarangModel>();
  final _barangIdFetchar = PublishSubject<BarangIdModel>();
  final _kategoriFetchar = PublishSubject<KategoriModel>();
  final _riwayatFetchar = PublishSubject<HistoriModel>();

  PublishSubject<BarangModel> get resBarang => _barangFetchar;
  PublishSubject<BarangIdModel> get resIdBarang => _barangIdFetchar;
  PublishSubject<KategoriModel> get resKategori => _kategoriFetchar;
  PublishSubject<HistoriModel> get resHistori => _riwayatFetchar;

  void getBarang() async {
    try {
      BarangModel barangModel = await repostory.getBarang();
      _barangFetchar.sink.add(barangModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void getIdBarang(String idBarang) async {
    try {
      BarangIdModel barangIdModel = await repostory.getBarangId(idBarang);
      _barangIdFetchar.sink.add(barangIdModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void addPinjam(
      BuildContext context,
      String idUser,
      String idBarang,
      String idKategori,
      String nama,
      String stok,
      String tanggalKembali) async {
    try {
      await repostory.createPinjam(
          context, idUser, idBarang, idKategori, nama, stok, tanggalKembali);
    } catch (e) {
      print(e.toString());
    }
  }

  void getKategori() async {
    try {
      KategoriModel kategoriModel = await repostory.getKategori();
      _kategoriFetchar.sink.add(kategoriModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void getRiwayat() async {
    try {
      HistoriModel historiModel = await repostory.getRiwayat();
      _riwayatFetchar.sink.add(historiModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void dipose() {
    _barangFetchar.close();
    _barangIdFetchar.close();
    _kategoriFetchar.close();
    _riwayatFetchar.close();
  }
}
