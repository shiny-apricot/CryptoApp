import 'package:cryptoapp/pages/addInvestment/selection_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountRow extends StatefulWidget {
  @override
  _CountRowState createState() => _CountRowState();

  static var staticCount = '0';

}

class _CountRowState extends State<CountRow> {

  TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0x28D3D3D3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(7, 0, 0, 5),
            child: Text(
              'Invested Count',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[200]
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFF002B32),
            ),
            child: TextField(
              onChanged: (text){
                CountRow.staticCount = text;
              },
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: textController,
              keyboardType: TextInputType.number,
              maxLength: 20,
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey[200],
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                hintText: "Count",
                hintStyle: TextStyle(
                    color: Color(0x60FFFFFF)
                ),
                suffixText: '${SelectionRow.staticSelectedCurrency}',
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}


