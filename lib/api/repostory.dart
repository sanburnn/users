import 'package:flutter/cupertino.dart';
import 'package:users/api/resource.dart';

class Repostory {
  final api = Resource();

  Future getBarang() => api.getBarang();

  Future getBarangId(String idBarang) => api.getBarangId(idBarang);

  Future createPinjam(
          BuildContext context,
          String idUser,
          String idBarang,
          String idKategori,
          String nama,
          String stok,
          String tanggalKembali,
          String token) =>
      api.createPinjam(context, idUser, idBarang, idKategori, nama, stok,
          tanggalKembali, token);

  Future getKategori() => api.getKategori();

  Future getRiwayat(String token) => api.getRiwayat(token);

  Future register(BuildContext context, String nim, String namaUser,
          String alamat, int jurusan, String noHp, String email, String pass) =>
      api.register(context, nim, namaUser, alamat, jurusan, noHp, email, pass);

  Future login(BuildContext context, String email, String pass) =>
      api.login(context, email, pass);

  Future getJurusan() => api.getJurusan();
}
