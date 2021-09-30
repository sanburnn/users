import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:users/api/repostory.dart';
import 'package:users/model/barangIdModel.dart';
import 'package:users/model/barangModel.dart';
import 'package:users/model/historiModel.dart';
import 'package:users/model/jurusanModel.dart';
import 'package:users/model/kategoriModel.dart';
import 'package:users/model/loginModel.dart';
import 'package:users/model/registerModel.dart';

class HomeController {
  final repostory = Repostory();

  final _barangFetchar = PublishSubject<BarangModel>();
  final _barangIdFetchar = PublishSubject<BarangIdModel>();
  final _kategoriFetchar = PublishSubject<KategoriModel>();
  final _riwayatFetchar = PublishSubject<HistoriModel>();
  final _registerFetchar = PublishSubject<RegisterModel>();
  final _loginFetchar = PublishSubject<LoginModel>();
  final _jurusanFetchar = PublishSubject<JurusanModel>();

  PublishSubject<BarangModel> get resBarang => _barangFetchar;
  PublishSubject<BarangIdModel> get resIdBarang => _barangIdFetchar;
  PublishSubject<KategoriModel> get resKategori => _kategoriFetchar;
  PublishSubject<HistoriModel> get resHistori => _riwayatFetchar;
  PublishSubject<RegisterModel> get resResgiter => _registerFetchar;
  PublishSubject<LoginModel> get reslogin => _loginFetchar;
  PublishSubject<JurusanModel> get resJurusan => _jurusanFetchar;

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
      String tanggalKembali,
      token) async {
    try {
      await repostory.createPinjam(context, idUser, idBarang, idKategori, nama,
          stok, tanggalKembali, token);
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

  void getRiwayat(String token) async {
    try {
      HistoriModel historiModel = await repostory.getRiwayat(token);
      _riwayatFetchar.sink.add(historiModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void register(
      BuildContext context,
      String nim,
      String namaUser,
      String alamat,
      int jurusan,
      String noHp,
      String email,
      String pass) async {
    try {
      RegisterModel registerModel = await repostory.register(
          context, nim, namaUser, alamat, jurusan, noHp, email, pass);
      _registerFetchar.sink.add(registerModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(BuildContext context, String email, String pass) async {
    try {
      LoginModel loginModel = await repostory.login(context, email, pass);
      _loginFetchar.sink.add(loginModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void getJurusan() async {
    try {
      JurusanModel jurusanModel = await repostory.getJurusan();
      _jurusanFetchar.sink.add(jurusanModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void dipose() {
    _barangFetchar.close();
    _barangIdFetchar.close();
    _kategoriFetchar.close();
    _riwayatFetchar.close();
    _registerFetchar.close();
    _loginFetchar.close();
    _jurusanFetchar.close();
  }
}
