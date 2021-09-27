import 'package:flutter/cupertino.dart';
import 'package:users/api/resource.dart';

class Repostory {
  final api = Resource();

  Future getBarang() => api.getBarang();

  Future getBarangId(String idBarang) => api.getBarangId(idBarang);

  Future createPinjam(BuildContext context, String idUser, String idBarang,
          String idKategori, String nama, String stok, String tanggalKembali) =>
      api.createPinjam(
          context, idUser, idBarang, idKategori, nama, stok, tanggalKembali);

  Future getKategori() => api.getKategori();

  Future getRiwayat() => api.getRiwayat();

  Future register(
          BuildContext context,
          String nim,
          String namaUser,
          String alamat,
          String jurusan,
          String noHp,
          String email,
          String role,
          String pass) =>
      api.register(
          context, nim, namaUser, alamat, jurusan, noHp, email, role, pass);

  Future login(BuildContext context, String email, String pass) =>
      api.login(context, email, pass);
}
