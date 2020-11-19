import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF003942),



              /*KODU BURAYA YAZIN*/



            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Divider(
              thickness: 0.5,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}