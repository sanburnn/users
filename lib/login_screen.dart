import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/dashboard.dart';
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
  bool _isHidden = true;
  void login() async {
    String email = emailController.text;
    String pass = passController.text;

    SharedPreferences shared = await SharedPreferences.getInstance();
    if (emailController.text != '' && passController.text != '') {
      con.login(context, email, pass);
      con.reslogin.listen((value) async {
        if (value.status) {
          await shared.setString('token', value.data.jwtToken);
          await shared.setString('iduser', value.data.iduser);
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
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -70,
                left: -50,
                child: Container(
                    height: 200,
                    width: 200,
                    child: Transform.translate(
                        offset: Offset(-5.0, 60.0),
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/elipse.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ))),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 32,
                            color: Color(0xff85d0757),
                          )),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image(
                      width: 300,
                      height: 300,
                      image: AssetImage('assets/images/assetlogin.png'),
                    ),
                  ),
                  Text(
                    'Welcome to Sarpras APP',
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ThemeData()
                              .colorScheme
                              .copyWith(primary: Color(0xff665588))),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE5E5E5),
                            hintText: "Masukkan Email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ThemeData()
                              .colorScheme
                              .copyWith(primary: Color(0xff665588))),
                      child: TextFormField(
                        obscureText: _isHidden,
                        controller: passController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE5E5E5),
                            hintText: "Masukkan Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: InkWell(
                                onTap: togglebutton,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ))),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please a Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff665588), shape: StadiumBorder()),
                      onPressed: () => login(),
                      child: Text("LOGIN"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                            width: 140,
                            height: 10,
                            child: Image.asset('assets/images/garis.png')),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Or'),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 140,
                          height: 10,
                          child: Image.asset('assets/images/garis.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff665588),
                              shape: StadiumBorder()),
                          child: Text('Sign Up'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          })),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'APP Powered by Team MBKM 2021',
                    style: TextStyle(fontFamily: 'Open Sans', fontSize: 12),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void togglebutton() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
