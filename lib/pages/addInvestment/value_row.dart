import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ValueRow extends StatelessWidget {

  static var staticInitialValue = '0';

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0x28D3D3D3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 170,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  'The value of 1 TRY at Investment Time',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[200]
                    ),
                  ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Color(0xFFFEAD34),
                ),
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){},
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Current Value',
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFF002B32),
            ),
            child: TextField(
              onChanged: (text){
                ValueRow.staticInitialValue = text;
              },
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLength: 20,
              maxLines: 1,
              enableSuggestions: false,
              style: TextStyle(
                color: Colors.grey[200],
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                hintText: "1 TRY =",
                hintStyle: TextStyle(
                    color: Color(0x60FFFFFF)
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
