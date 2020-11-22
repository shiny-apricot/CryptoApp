import 'package:cryptoapp/pages/addInvestment/adding_row.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/addInvestment/value_row.dart';
import 'package:cryptoapp/pages/addInvestment/count_row.dart';
import 'package:cryptoapp/pages/addInvestment/selection_row.dart';
import 'package:cryptoapp/misc/route_generator.dart';

class AddInvestment extends StatefulWidget {
  @override
  _AddInvestmentState createState() => _AddInvestmentState();
}

class _AddInvestmentState extends State<AddInvestment> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Investment'),
          backgroundColor: Color(0xFF002B32),
          toolbarHeight: 70.0,
        ),
        body: SafeArea(
          child: Container(
            color: Color(0xFF003942),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Column(
              children: [
                SelectionRow(),
                CountRow(),
                ValueRow(),
                AddingRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

