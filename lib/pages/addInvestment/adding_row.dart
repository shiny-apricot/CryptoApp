import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingRow extends StatelessWidget {

  double _investmentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
              Container(
                height: 70,
                width: 230,
                // margin: EdgeInsets.fromLTRB(60, 30, 60, 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color(0xFFFEAD34),
                ),
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){
                    Navigator.of(context).pushNamed('/myInvestment');
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
        )
    );
  }
}
