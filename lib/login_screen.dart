import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/dashboard.dart';
import 'package:users/signup_screen.dart';

import 'bottom_nav_screen.dart';

class LoginScreen extends StatelessWidget {
  final con = HomeController();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final tokenController = TextEditingController();

  void login(context) async {
    String email = emailController.text;
    String pass = passController.text;
    String token = tokenController.text;

    SharedPreferences shared = await SharedPreferences.getInstance();
    if (email == '' && pass == '') {
      await shared.setString('token', token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
        ),
      );
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.asset('assets/images/logo1.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Masukkan Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Masukkan Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }
                      var password;
                      print(password.text);

                      var confirmpassword;
                      print(confirmpassword.text);

                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      if (emailController.text == '' &&
                          passController.text == '') {
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavScreen()));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: ElevatedButton(
                        child: Text('Sign Up'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
