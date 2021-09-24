// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class KategoriModel {
  KategoriModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory KategoriModel.fromJson(String str) =>
      KategoriModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KategoriModel.fromMap(Map<String, dynamic> json) => KategoriModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.idKategori,
    this.namaKategori,
  });

  String idKategori;
  String namaKategori;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idKategori: json["id_kategori"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toMap() => {
        "id_kategori": idKategori,
        "nama_kategori": namaKategori,
      };
}
