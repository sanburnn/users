import 'package:flutter/material.dart';
import 'package:users/providers/provider.dart';
import 'package:users/forgot_password.dart';
import 'package:users/dashboard.dart';
import 'package:users/login_screen.dart';
import 'package:users/signup_screen.dart';
import 'package:users/services/auth_service.dart';
import 'package:users/bottom_nav_screen.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "LOGIN",
        home: FutureBuilder(
          future: AuthService.getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return BottomNavScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/home': (_) => BottomNavScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
        },
      ),
    );
  }
}