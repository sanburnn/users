import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  static String mainUrl = "https://maisyaroh.com/server_sarpras";
  var loginUrl = '$mainUrl/api/user/login';
  //var registerUrl = '$mainUrl/api/register';

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });
    return response.data["token"];
  }

  //Future<String> register(String email, String password) async {
  //Response response = await _dio.post(registerUrl, data: {
  //"email": email,
  //"password": password,
  //});
  //return response.data["token"];
  //}
}
