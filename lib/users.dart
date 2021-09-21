import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsersState();
  }
}

class UsersState extends State<Users> {
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
            onPressed: () {
              SystemNavigator.pop();

              // exit(0);
            },
            child: Text('LogOut'),
          ),
        ),
      ),
    );
  }
}
