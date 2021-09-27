// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    this.status,
    this.data,
    this.message,
  });

  bool status;
  Data data;
  String message;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
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
    this.jwtToken,
    this.email,
    this.namaUser,
  });

  String jwtToken;
  String email;
  String namaUser;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        jwtToken: json["jwt_token"],
        email: json["email"],
        namaUser: json["nama_user"],
      );

  Map<String, dynamic> toMap() => {
        "jwt_token": jwtToken,
        "email": email,
        "nama_user": namaUser,
      };
}
