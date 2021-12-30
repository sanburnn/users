import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users/config/palette.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/landing.dart';
import 'package:users/intro_screen.dart';

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
          builder: (context) => IntroPage(),
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
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -90,
                left: -125,
                child: Container(
                    height: 300,
                    width: 250,
                    child: Transform.translate(
                        offset: Offset(-5.0, 60.0),
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/elipse2.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ))),
              ),
              ListView(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                  )
                ],
              ),
              Positioned(
                bottom: 180,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        width: 300,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF5F6F9),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                                height: 50,
                              ),
                              Container(
                                child:
                                    Image.asset('assets/images/abouticons.png'),
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Nunito Sans"),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff909090),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: SizedBox(
                        width: 300,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF5F6F9),
                            padding: EdgeInsets.all(20),
                          ),
                          onPressed: () => logOut(),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                                height: 50,
                              ),
                              Container(
                                child:
                                    Image.asset('assets/images/exiticons.png'),
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Nunito Sans"),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff909090),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -40,
                right: -135,
                child: Container(
                    height: 350,
                    width: 380,
                    child: Transform.translate(
                        offset: Offset(-5.0, 60.0),
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/elipse3.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ))),
              ),
              Positioned(
                bottom: 20,
                left: 50,
                child: Text(
                  'Powered by Team MBKM Jong Java',
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
