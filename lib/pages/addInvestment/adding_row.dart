import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/data/db_helper.dart';
import 'package:cryptoapp/data/model/Investment.dart';
import 'package:cryptoapp/pages/addInvestment/count_row.dart';
import 'package:cryptoapp/pages/addInvestment/selection_row.dart';
import 'package:cryptoapp/pages/addInvestment/value_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingRow extends StatefulWidget {
  @override
  _AddingRowState createState() => _AddingRowState();

}

class _AddingRowState extends State<AddingRow> {

  double _investmentValue = 0;
  DBHelper dbhelper = DBHelper();
  Investment investment;

  @override
  void initState() {
    // investment = new Investment(null,null,null,null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 30, 0, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Current Value of Your Investment \n\$$_investmentValue',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Container(
            height: 60,
            width: 230,
            // margin: EdgeInsets.fromLTRB(60, 30, 60, 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Color(0xFFFEAD34),
            ),
            child: FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: (){
                String initialValue = ValueRow.staticInitialValue;
                String count = CountRow.staticCount;
                String selectedCurrency = SelectionRow.staticSelectedCurrency;

                investment = Investment(null, selectedCurrency, count, initialValue);
                print('count= $count initialValue= $initialValue');

                dbhelper.insertInvestment(investment).then((id) {
                  FirebaseInvestment firebase = FirebaseInvestment();
                  firebase.addInvestment(
                      id,
                      count,
                      selectedCurrency,
                      initialValue
                  );

                  Navigator.of(context).pushNamed('/home');
                });
              },
              color: Colors.transparent,
              child: Text(
                'Add Investment',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FirebaseInvestment {

  Future<void> addInvestment(int id,String investmentCount, String investmentCurrency, String investmentInitialValue){

    DocumentReference investments = FirebaseFirestore.instance.collection('investments').doc("$id");
    var data = {
        'id': id,
        'currency':investmentCurrency,
        'count': investmentCount,
        'initial_value':investmentInitialValue
    };
    return investments.set(data).then((value) {
      print('%%%%%% $investmentCount added to FireStore... %%%%%%');
    });

  }


}


