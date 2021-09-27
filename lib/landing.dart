import 'package:flutter/material.dart';
import 'package:users/bottom_nav_screen.dart';
import 'package:users/theme.dart';

import 'login_screen.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo1.png"),
                  scale: 1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "SarpraS\n\n",
                          style: blackTextStyle.copyWith(
                              fontSize: 30, fontWeight: semiBold)),
                      TextSpan(
                          text: "Peminjaman Barang",
                          style: blackTextStyle.copyWith(
                            fontSize: 27,
                          ))
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kBlueColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text("MASUK APLIKASI",
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                              )),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//contoh