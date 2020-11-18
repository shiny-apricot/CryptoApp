import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 200,
          height: 200,
          child: ListTile(
            tileColor: Colors.grey,
            leading: Icon(
              Icons.access_time,
              color: Colors.blue,
            ),
          )
         )
        ),
      )
    );
  }
}
