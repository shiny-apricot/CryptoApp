
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CryptoAlert extends StatefulWidget {
  @override
  _CryptoAlertState createState() => _CryptoAlertState();
}

class _CryptoAlertState extends State<CryptoAlert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF003942),
        appBar: AppBar(
          backgroundColor: Color(0xFF002B32),
          title: Text('My Profile'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [

            ],
          ),

        ),
      ),
    );
  }
}
