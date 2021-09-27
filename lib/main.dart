import 'package:flutter/material.dart';
import 'package:users/landing.dart';
import 'package:users/signup_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
    );
  }
}
