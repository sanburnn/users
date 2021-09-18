import 'package:flutter/material.dart';
import 'package:users/bottom_nav_screen.dart';
import 'package:users/landing.dart';
import 'package:users/dashboard.dart';
import 'package:users/kategori.dart';
import 'package:users/pinjam.dart';
import 'package:users/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing(),
    );
  }
}
