import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/config/palette.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/landing.dart';
import 'package:users/login_screen.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsersState();
  }
}

class UsersState extends State<Users> {
  final con = HomeController();

  void logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Landing(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () => logOut(),
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(180, 50),
                primary: Palette.primaryColor,
              )),
        ),
      ),
    );
  }
}
