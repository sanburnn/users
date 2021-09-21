import 'dart:convert';

class BarangModel {
  BarangModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory BarangModel.fromJson(String str) =>
      BarangModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BarangModel.fromMap(Map<String, dynamic> json) => BarangModel(
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
    this.idBarang,
    this.idKategori,
    this.nama,
    this.stok,
    this.harga,
    this.tanggal,
    this.createDate,
    this.namaKategori,
  });
  String idBarang;
  String idKategori;
  String nama;
  String stok;
  String harga;
  DateTime tanggal;
  DateTime createDate;
  String namaKategori;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idBarang: json["id_barang"],
        idKategori: json["id_kategori"],
        nama: json["nama"],
        stok: json["stok"],
        harga: json["harga"],
        tanggal: DateTime.parse(json["tanggal"]),
        createDate: DateTime.parse(json["create_date"]),
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toMap() => {
        "id_barang": idBarang,
        "id_kategori": idKategori,
        "nama": nama,
        "stok": stok,
        "harga": harga,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "create_date": createDate.toIso8601String()
      };
}
