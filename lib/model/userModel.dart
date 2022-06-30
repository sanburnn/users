// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
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
    this.idUser,
    this.nim,
    this.namaUser,
    this.idJurusan,
    this.alamat,
    this.email,
    this.password,
    this.noHp,
    this.role,
  });

  String idUser;
  String nim;
  String namaUser;
  String idJurusan;
  String alamat;
  String email;
  String password;
  String noHp;
  String role;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        idUser: json["id_user"],
        nim: json["nim"],
        namaUser: json["nama_user"],
        idJurusan: json["id_jurusan"],
        alamat: json["alamat"],
        email: json["email"],
        password: json["password"],
        noHp: json["no_hp"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "nim": nim,
        "nama_user": namaUser,
        "id_jurusan": idJurusan,
        "alamat": alamat,
        "email": email,
        "password": password,
        "no_hp": noHp,
        "role": role,
      };
}
