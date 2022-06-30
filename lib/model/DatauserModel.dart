// To parse this JSON data, do
//
//     final dataUserModel = dataUserModelFromMap(jsonString);

import 'dart:convert';

class DataUserModel {
  DataUserModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory DataUserModel.fromJson(String str) =>
      DataUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUserModel.fromMap(Map<String, dynamic> json) => DataUserModel(
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
    this.idUser,
    this.namaUser,
    this.nim,
    this.namaJurusan,
    this.email,
  });

  String idUser;
  String namaUser;
  String nim;
  String namaJurusan;
  String email;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idUser: json["id_user"],
        namaUser: json["nama_user"],
        nim: json["nim"],
        namaJurusan: json["nama_jurusan"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "nama_user": namaUser,
        "nim": nim,
        "nama_jurusan": namaJurusan,
        "email": email,
      };
}
