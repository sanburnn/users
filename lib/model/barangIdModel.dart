// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class BarangIdModel {
  BarangIdModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory BarangIdModel.fromJson(String str) =>
      BarangIdModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BarangIdModel.fromMap(Map<String, dynamic> json) => BarangIdModel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
        "message": message,
      };
}

class Data {
  Data({
    this.idBarang,
    this.idKategori,
    this.nama,
    this.stok,
    this.harga,
    this.tanggal,
    this.createDate,
  });

  String idBarang;
  String idKategori;
  String nama;
  String stok;
  String harga;
  DateTime tanggal;
  DateTime createDate;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        idBarang: json["id_barang"],
        idKategori: json["id_kategori"],
        nama: json["nama"],
        stok: json["stok"],
        harga: json["harga"],
        tanggal: DateTime.parse(json["tanggal"]),
        createDate: DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toMap() => {
        "id_barang": idBarang,
        "id_kategori": idKategori,
        "nama": nama,
        "stok": stok,
        "harga": harga,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "create_date": createDate.toIso8601String(),
      };
}
