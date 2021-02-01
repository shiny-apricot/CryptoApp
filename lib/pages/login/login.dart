import 'package:cryptoapp/pages/login/login_horizontal.dart';
import 'package:cryptoapp/pages/login/login_vertical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool checkValue = false;

  Widget mediaQuery({double width, double height}){
    if(width > height)
      return LoginHorizontal();
    if(height > width)
      return LoginVertical();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
        body: mediaQuery(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        ),
    );
  }
}
