import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users/model/barangIdModel.dart';
import 'package:users/model/barangModel.dart';

class Resource {
  var uri = "https://maisyaroh.com/sarpras/api";

  Future getBarang() async {
    var url = Uri.parse(uri + '/barang');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      // print(res.body);
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
    var url = Uri.parse('$uri/barang/get_id/$idBarang');

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

  Future createPinjam(
      BuildContext context,
      String idUser,
      String idBarang,
      String idKategori,
      String nama,
      String stok,
      String tanggalKembali) async {
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
          .post(url, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 11));

      if (res.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil menambah data!')),
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
}
