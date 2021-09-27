import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseUrl = "https://maisyaroh.com/server_sarpras/api";
  // ignore: non_constant_identifier_names
  static final SESSION = FlutterSession();

  Future<dynamic> register(String email, String password) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
      'nim': "768767",
      'nama_user': "jshkj",
      'alamat': "hjasga",
      'jurusan': "hsgja",
      'no_hp': "ushgsg",
      'role': "gahjs"
    });
    try {
      var res = await http.post('$baseUrl/user/register', body: body);
      return res?.body;
    } finally {
      // done you can do something here
    }
  }

  Future<dynamic> login(String email, String password) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
      'token': 'SdxIpaQp!81XS#QP5%w^cTCIV*DYr',
    });
    try {
      var res = await http.post('$baseUrl/user/login', body: body);

      return res?.body;
    } finally {
      // you can do somethig here
    }
  }

  static setToken(String token, String refreshToken) async {
    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken() async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token, refreshToken, clientId;
  _AuthData(this.token, this.refreshToken, {this.clientId});

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;
    return data;
  }
}
