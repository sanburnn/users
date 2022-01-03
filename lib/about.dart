import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -90,
            left: -125,
            child: Container(
                height: 250,
                width: 250,
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
            top: 40,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 70,
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
                height: 60,
              ),
              Center(
                child: Text(
                  'About',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  'Source Picture of Illustration',
                  style: TextStyle(
                      color: Color(0xff303030),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'https://icons8.com/illustrations/illustration/marginalia-unsubscribed',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xff808080),
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'https://i2.wp.com/activo.co.id/wp-content/uploads/2017/01/inventory-icon-6.png?ssl=1',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xff808080),
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'https://icons8.com/illustrations/illustration/pablo-camera-access',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xff808080),
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: Container(
                height: 240,
                width: 240,
                child: Transform.translate(
                    offset: Offset(-5.0, 60.0),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/images/elipse5.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
