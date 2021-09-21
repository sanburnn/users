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
}
