import 'dart:convert';

class LoginModel {
  LoginModel({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
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
  Datum({this.email, this.password, this.token});
  String email;
  String password;
  String token;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
      email: json["email"], password: json["password"], token: json['token']);

  Map<String, dynamic> toMap() =>
      {"email": email, "password": password, "token": token};
}
