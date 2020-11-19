import 'package:flutter/material.dart';

class MyInvestments extends StatefulWidget {
  @override
  _MyInvestmentsState createState() => _MyInvestmentsState();
}

class _MyInvestmentsState extends State<MyInvestments> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Divider(
              thickness: 0.5,
              color: Colors.white38,
            ),
          ),
        )
      ],
    );
  }
}
