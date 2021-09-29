import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/signup_screen.dart';

import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final con = HomeController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  final tokenController = TextEditingController();

  bool inHiddenPass = true;

  void login() async {
    String email = emailController.text;
    String pass = passController.text;

    SharedPreferences shared = await SharedPreferences.getInstance();
    if (emailController.text != '' && passController.text != '') {
      con.login(context, email, pass);
      con.reslogin.listen((value) async {
        if (value.status) {
          await shared.setString('token', value.data.jwtToken);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Harus Di isi')),
      );
    }
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    if (token != '' && token != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavScreen(),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Masukkan Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Icon(Icons.email)),
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
                    obscureText: inHiddenPass,
                    controller: passController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Masukkan Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: InkWell(
                            onTap: togglebutton,
                            child: Icon(Icons.visibility))),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => login(),
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

  void togglebutton() {
    setState(() {
      inHiddenPass = !inHiddenPass;
    });
  }
}
