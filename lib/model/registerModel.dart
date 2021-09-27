import 'dart:convert';

class RegisterModel {
  RegisterModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
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
  Datum(
      {this.nim,
      this.nama,
      this.alamat,
      this.jurusan,
      this.noHp,
      this.email,
      this.role,
      this.password});

  String nim;
  String nama;
  String alamat;
  String jurusan;
  String noHp;
  String email;
  String role;
  String password;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        email: json["email"],
        password: json["password"],
        nim: json["password"],
        nama: json["password"],
        alamat: json['alamat'],
        jurusan: json['jurusan'],
        noHp: json['noHp'],
        role: json['role'],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "nim": nim,
        "nama": nama,
        "alamat": alamat,
        "jurusan": jurusan,
        "noHp": noHp,
        "role": role
      };
}
