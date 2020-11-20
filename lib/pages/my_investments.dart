import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/data/investment.dart';
import 'package:cryptoapp/data/currencyValues.dart';

class MyInvestments extends StatefulWidget {
  @override
  _MyInvestmentsState createState() => _MyInvestmentsState();
}

class _MyInvestmentsState extends State<MyInvestments> {

  Widget profitCalculator(Investment investment){

    double profit;

    if(investment.type == 'BTC')
      profit = (CurrencyValues.BTC - investment.initialValue)*investment.count;
    else if(investment.type == 'TRY')
      profit = (CurrencyValues.TRY - investment.initialValue)*investment.count;
    else if(investment.type == 'ETH')
      profit = (CurrencyValues.ETH - investment.initialValue)*investment.count;

    if(profit >= 0)
      return Text('+${profit}',
        style: TextStyle(
          color: Colors.green
       ),
      );
    else
      return Text('+${profit}',
        style: TextStyle(
            color: Colors.redAccent
        ),
      );
  }

  double valueCalculator(Investment investment){
    if(investment.type == 'BTC')
      return investment.count * CurrencyValues.BTC;
    else if(investment.type == 'TRY')
      return investment.count * CurrencyValues.TRY;
    else if(investment.type == 'ETH')
      return investment.count * CurrencyValues.ETH;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),

              color: Color(0xFF003942),

              child: ListView.builder(
                itemCount: investList.length,

                itemBuilder: (context,index){
                  Investment inv = investList[index];
                  return Card(
                    color: Color(0xFF002B32),

                    child: ExpansionTile(
                      backgroundColor: Color(0xFF002B32),
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      tilePadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      childrenPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),

                      title: Row(
                        children: [
                          Text('${inv.count} ${inv.type}',
                            style: TextStyle( color: Colors.white ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          profitCalculator(inv)
                        ],
                      ),

                      children: [
                        Text('Initial Value: \$${inv.count * inv.initialValue}',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 18.0,
                          ),
                        ),
                        Text('Current Value: \$${valueCalculator(inv)}',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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

  List<Investment> investList = <Investment>[
    Investment(count: 1.23,initialValue: 34000,type: 'BTC'),
    Investment(count: 532,initialValue: 0.234,type: 'TRY'),
    Investment(count: 2144,initialValue: 623,type: 'ETH'),
    Investment(count: 0.21,initialValue: 20000,type: 'BTC'),
    Investment(count: 5.234,initialValue: 34000,type: 'BTC'),
  ];
}