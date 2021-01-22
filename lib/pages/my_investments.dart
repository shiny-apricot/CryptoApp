import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/db_helper.dart';
import 'package:cryptoapp/data/model/Investment.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class MyInvestments extends StatefulWidget {
  @override
  _MyInvestmentsState createState() => _MyInvestmentsState();
}

class _MyInvestmentsState extends State<MyInvestments> {

  DBHelper dbhelper = DBHelper();
  CryptoApiService apiService;

  @override
  initState(){
    print("init state");
    super.initState();
  }

  Future<Widget> profitCalculator(Investment investment) async{
    print('PROFIT CALCULATOR');
    double profit;

    var currency = investment.currency;
    apiService = CryptoApiService(ids: '$currency');

    var currencyList = await apiService.getObjects();

    Currency currentCurrency = currencyList[0];
    String currentCurrencyValueString = currentCurrency.price;
    double currentCurrencyValue = double.parse(currentCurrencyValueString);

    var oldCurrencyValueString = investment.initialCurrencyValue;
    double oldCurrencyValue = double.parse(oldCurrencyValueString);

    var amount = double.parse(investment.amount);
    print('AMOUNT = $amount');
    profit = (currentCurrencyValue*amount) - (oldCurrencyValue*amount);
    print('PROFIT = $profit');

    if(profit >= 0) {
      print('profit plus');
      return Text(
        '+${profit}',
        style: TextStyle(
            color: Colors.green,
            fontSize: 17
        ),
      );
    }
    else {
      print('profit minus');
      return Text('${profit}',
        style: TextStyle(
            color: Colors.redAccent,
            fontSize: 17
        ),
      );
    }
  }

  Future<List> getInvestList() async{
    print('GET INVEST LIST');
    List list = await dbhelper.getInvestmentList();
    return list;
  }

  Future<double> valueCalculator(Investment investment) async{
    print('VALUE CALCULATOR');
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
                  List data = snapshot.data;
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.hasError)
                      return Center(child: Text("error"));
                    else if(data.length > 0){
                      List snapshotInvestments = snapshot.data;
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
                              subtitle: FutureBuilder(
                                future: profitCalculator(inv),
                                builder: (BuildContext context, AsyncSnapshot snapshot){
                                  if(snapshot.connectionState == ConnectionState.waiting)
                                    return Text('Waiting...');
                                  else {
                                    if (snapshot.hasError)
                                      return Text('ERROR');
                                    else
                                      return snapshot.data;
                                  }
                                },
                              ),
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
                                SizedBox(height: 15),
                                FlatButton(
                                  onPressed: (){
                                    Investment investment = snapshotInvestments[index];
                                    dbhelper.deleteInvestment(investment.id);
                                    deleteInvestment(investment.id);
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text('DELETE')
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else{
                      print('EMPTY!!!');
                        return Center(
                          child: Text(
                              "YOU DIDN'T INVEST ANYTHING! \nWHAT DO YOU EXPECT TO SEE???",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          )
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

  Future<void> deleteInvestment(int id) async{
    print('delete $id');
    DocumentReference investments = FirebaseFirestore.instance.collection('investments').doc('$id');
    investments.delete();
  }
}

