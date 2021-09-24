// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class HistoriModel {
  HistoriModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory HistoriModel.fromJson(String str) =>
      HistoriModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoriModel.fromMap(Map<String, dynamic> json) => HistoriModel(
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
    this.nama,
    this.jumlah,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.statusTransaksi,
  });

  String nama;
  String jumlah;
  DateTime tanggalPinjam;
  DateTime tanggalKembali;
  String statusTransaksi;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        nama: json["nama"],
        jumlah: json["jumlah"],
        tanggalPinjam: DateTime.parse(json["tanggal_pinjam"]),
        tanggalKembali: DateTime.parse(json["tanggal_kembali"]),
        statusTransaksi: json["status_transaksi"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "jumlah": jumlah,
        "tanggal_pinjam": tanggalPinjam.toIso8601String(),
        "tanggal_kembali": tanggalKembali.toIso8601String(),
        "status_transaksi": statusTransaksi,
      };
}
