// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);

import 'dart:convert';

class JurusanModel {
  JurusanModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory JurusanModel.fromJson(String str) =>
      JurusanModel.fromMap(json.decode(str));

  get result => null;

  String toJson() => json.encode(toMap());

  factory JurusanModel.fromMap(Map<String, dynamic> json) => JurusanModel(
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
    this.idJurusan,
    this.namaJurusan,
  });

  String idJurusan;
  String namaJurusan;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idJurusan: json["id_jurusan"],
        namaJurusan: json["nama_jurusan"],
      );

  Map<String, dynamic> toMap() => {
        "id_jurusan": idJurusan,
        "nama_jurusan": namaJurusan,
      };
}
