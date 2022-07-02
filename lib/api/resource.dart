import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users/model/DatauserModel.dart';
import 'package:users/model/barangIdModel.dart';
import 'package:users/model/barangModel.dart';
import 'package:users/model/historiModel.dart';
import 'package:users/model/jurusanModel.dart';
import 'package:users/model/kategoriModel.dart';
import 'package:users/model/loginModel.dart';
import 'package:users/model/registerModel.dart';
import 'package:users/model/userModel.dart';

class Resource {
  var uri = "https://tumbasonline.com/sarpras/api";

  Future getBarang() async {
    var url = Uri.parse(uri + '/barang');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return BarangModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return BarangModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getBarangId(String idBarang) async {
    var url = Uri.parse('$uri/barang/get_Id/$idBarang');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      // print(res.body);
      if (res.statusCode == 200) {
        return BarangIdModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return BarangIdModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future createPinjam(BuildContext context, String idUser, idBarang, idKategori,
      nama, stok, tanggalKembali, token) async {
    var body = jsonEncode({
      'id_user': idUser,
      'id_barang': idBarang,
      'id_kategori': idKategori,
      'stok': stok,
      'tkembali': tanggalKembali,
    });
    var url = Uri.parse('$uri/pinjam/pinjam');
    try {
      final res = await http
          .post(url,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil mengajukan')),
        );
        return true;
      } else if (res.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambah data!')),
        );
        return false;
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getKategori() async {
    var url = Uri.parse(uri + '/kategori');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      print(res.statusCode);
      if (res.statusCode == 200) {
        return KategoriModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return KategoriModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getRiwayat(String token) async {
    var url = Uri.parse(uri + '/pinjam/riwayat');

    try {
      final res = await http.get(url, headers: {
        'Authorization': token
      }).timeout(const Duration(seconds: 11));
      // print(res.body);
      if (res.statusCode == 200) {
        return HistoriModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return HistoriModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Riwayat");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future register(
      BuildContext context,
      String nim,
      String namaUser,
      String alamat,
      String jurusan,
      String noHp,
      String email,
      String pass) async {
    var body = jsonEncode({
      'nim': nim,
      'nama_user': namaUser,
      'alamat': alamat,
      'id_jurusan': jurusan,
      'no_hp': noHp,
      'email': email,
      'password': pass
    });
    var url = Uri.parse(uri + '/user/register');
    try {
      final res = await http
          .post(url, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda Berhasil Register')),
        );
        return RegisterModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambah data!')),
        );
        return false;
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future login(BuildContext context, String email, String pass) async {
    var body = jsonEncode({'email': email, 'password': pass});
    var url = Uri.parse('$uri/user/login');

    try {
      final res = await http
          .post(url, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda Berhasil Login!')),
        );
        return LoginModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal')),
        );
        return LoginModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getJurusan() async {
    var url = Uri.parse(uri + '/user/jurusan');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return JurusanModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return JurusanModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getuser() async {
    var url = Uri.parse(uri + '/user');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return DataUserModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return DataUserModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getUserId(String iduser, String token) async {
    var url = Uri.parse('$uri/user/get_Id/$iduser');

    try {
      final res = await http.get(url, headers: {
        'Authorization': token
      }).timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return UserModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}
