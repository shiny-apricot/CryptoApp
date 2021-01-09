import 'dart:html';

import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/db_helper.dart';
import 'package:cryptoapp/data/model/Investment.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/data/investment.dart';
import 'package:cryptoapp/data/currencyValues.dart';


class MyInvestments extends StatefulWidget {
  @override
  _MyInvestmentsState createState() => _MyInvestmentsState();
}

class _MyInvestmentsState extends State<MyInvestments> {

  DBHelper dbhelper = DBHelper();
  CryptoApiService apiService;

  @override
  initState(){
    super.initState();

    print("init state");

    // Investment investment = new Investment(null,'myinvestment','900');
    // var result;
    // dbhelper.insertInvestment(investment).then((value)  {
    //   result=value;
    //   print("==== RESULT = $result");
    //   dbhelper.getCount().then((value) => print(value));
    // }
    // );
  }

  Widget profitCalculator(Investment investment){
    double profit;

    // if(investment.type == 'BTC')
    //   profit = (CurrencyValues.BTC - investment.initialValue)*investment.count;
    // else if(investment.type == 'TRY')
    //   profit = (CurrencyValues.TRY - investment.initialValue)*investment.count;
    // else if(investment.type == 'ETH')
    //   profit = (CurrencyValues.ETH - investment.initialValue)*investment.count;

    if(profit >= 0)
      return Text(
        '+${profit}',
        style: TextStyle(
          color: Colors.green,
          fontSize: 17
       ),
      );
    else
      return Text('${profit}',
        style: TextStyle(
            color: Colors.redAccent,
            fontSize: 17
        ),
      );
  }


  Future<List> getInvestList() async{
    List list = await dbhelper.getInvestmentList();
    return list;
  }

  Future<double> valueCalculator(Investment investment) async{
    var currency = investment.currency;

    apiService = CryptoApiService(ids: currency);
    var currencyList = await apiService.getObjects();

    Currency currencyObject = currencyList[0];
    String price = currencyObject.price;

    double doublePrice = double.parse(price);
    double doubleInvestedAmount = double.parse(investment.amount);

    var result = (doublePrice * doubleInvestedAmount);
    print('VALUE CALCULATOR RESULT = $result');
    return result;
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
              child: FutureBuilder(
                future: getInvestList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  else if (snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.hasError)
                      return Text("error");
                    else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Investment inv = snapshot.data[index];
                          return Card(
                            color: Color(0xFF002B32),
                            child: ExpansionTile(
                              backgroundColor: Color(0xFF002B32),
                              expandedCrossAxisAlignment: CrossAxisAlignment
                                  .stretch,
                              tilePadding: EdgeInsets.fromLTRB(25, 15, 10, 5),
                              childrenPadding: EdgeInsets.fromLTRB(
                                  25, 10, 25, 25),
                              trailing: Container(
                                width: 110,
                                child: Row(
                                  children: [
                                    Text(
                                      'See Details',
                                      style: TextStyle(
                                          color: Colors.grey[400]
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color: Colors.grey[400],
                                    )
                                  ],
                                ),
                              ),
                              title: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text('${inv.amount} ${inv.currency}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              subtitle: profitCalculator(inv),
                              children: [
                                Text('Initial Value:',
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text('\$${inv.amount
                                    // * inv.initialValue
                                }',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text('Current Value:',
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text('\$${valueCalculator(inv)}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                  else{
                    return Text('unknown error');
                  }
                }
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


}
