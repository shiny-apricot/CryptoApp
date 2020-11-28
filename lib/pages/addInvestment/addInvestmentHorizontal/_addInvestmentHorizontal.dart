import 'package:cryptoapp/pages/addInvestment/adding_row.dart';
import 'package:cryptoapp/pages/addInvestment/count_row.dart';
import 'package:cryptoapp/pages/addInvestment/selection_row.dart';
import 'package:cryptoapp/pages/addInvestment/value_row.dart';
import 'package:flutter/material.dart';

class AddInvestmentHorizontal extends StatefulWidget {
  @override
  _AddInvestmentHorizontalState createState() => _AddInvestmentHorizontalState();
}

class _AddInvestmentHorizontalState extends State<AddInvestmentHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Investment'),
        backgroundColor: Color(0xFF002B32),
        toolbarHeight: 50.0,
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFF003942),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView(
            children: [
              SelectionRow(),
              CountRow(),
              ValueRow(),
              AddingRow(),
            ],
          )


        ),
      ),
    );
  }
}
