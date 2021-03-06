// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);

import 'dart:convert';

class RegisterModel {
  RegisterModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
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
    this.email,
    this.namaUser,
    this.nim,
    this.idJurusan,
    this.noHp,
  });

  String email;
  String namaUser;
  String nim;
  String idJurusan;
  String noHp;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        email: json["email"],
        namaUser: json["nama_user"],
        nim: json["nim"],
        idJurusan: json["id_jurusan"],
        noHp: json["no_hp"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "nama_user": namaUser,
        "nim": nim,
        "id_jurusan": idJurusan,
        "no_hp": noHp,
      };
}
