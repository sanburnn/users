import 'package:flutter/material.dart';
import 'package:users/dashboard.dart';
import 'package:users/intro_screen.dart';
import 'package:users/landing.dart';
import 'package:users/signup_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
}
