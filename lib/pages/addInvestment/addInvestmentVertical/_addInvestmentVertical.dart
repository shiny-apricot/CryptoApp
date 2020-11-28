import 'package:cryptoapp/pages/addInvestment/adding_row.dart';
import 'package:cryptoapp/pages/addInvestment/count_row.dart';
import 'package:cryptoapp/pages/addInvestment/selection_row.dart';
import 'package:cryptoapp/pages/addInvestment/value_row.dart';
import 'package:flutter/material.dart';

class AddInvestmentVertical extends StatefulWidget {
  @override
  _AddInvestmentVerticalState createState() => _AddInvestmentVerticalState();
}

class _AddInvestmentVerticalState extends State<AddInvestmentVertical> {
  @override
  Widget build(BuildContext context) {
    print('vertical');
    return Scaffold(
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
              Expanded(
                flex: 3,
                child: SelectionRow(),
              ),
              Expanded(
                flex: 5,
                child: CountRow(),
              ),
              Expanded(
                flex: 7,
                child: ValueRow(),
              ),
              Expanded(
                flex: 8,
                child: AddingRow(),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
