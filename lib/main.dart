import 'package:flutter/material.dart';
import 'package:users/landing.dart';
import 'package:users/dashboard.dart';
import 'package:users/kategori.dart';
import 'package:users/pinjam.dart';
import 'package:users/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
    );
  }
}
