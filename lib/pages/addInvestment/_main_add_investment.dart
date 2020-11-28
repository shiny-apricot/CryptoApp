import 'package:cryptoapp/pages/addInvestment/addInvestmentHorizontal/_addInvestmentHorizontal.dart';
import 'package:cryptoapp/pages/addInvestment/addInvestmentVertical/_addInvestmentVertical.dart';
import 'package:flutter/material.dart';

class AddInvestmentMain extends StatefulWidget {
  @override
  _AddInvestmentMainState createState() => _AddInvestmentMainState();
}

class _AddInvestmentMainState extends State<AddInvestmentMain> {
  // ignore: missing_return
  Widget mediaQuery({double width, double height}){
    if(height >= width)
      return AddInvestmentVertical();
    if(width >= height)
      return AddInvestmentHorizontal();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mediaQuery(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
      )
    );
  }
}

