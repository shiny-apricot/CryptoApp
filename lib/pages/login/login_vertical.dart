import 'package:cryptoapp/data/currencyValues.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/material.dart';

class LoginVertical extends StatefulWidget {
  @override
  _LoginVerticalState createState() => _LoginVerticalState();
}

class _LoginVerticalState extends State<LoginVertical> {



  @override
  void initState(){
    //YUSUF ARAMA KOMUTU BURADA ISTEDIGINI ARIYON BU KOMUTLA BUNU ISTEDIGIN YERDE KULLAN

    // CurrencyValues cv = new CurrencyValues();
    // List result = cv.search('');
    //     // List objects = List();
    //     // count = 0;
    //     // for(i) {
    //     //   if(count < 20) {
    //     //     CryptoApiService cap = CryptoApiService(ids: result[i]);
    //     //     var data = cap.getObjects();
    //     //     objects.add(data);
    //     //   }
    //     //   count++;
    // }

    //SANA BI ID LISTESI DONDURUYO BU ID'LERLE API DAN ARAMA YAPACAN
  }

  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFF003942),
      child:Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              alignment: Alignment.center,
              child: Text(
                'Crypto App',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(top: 20,right: 30, left: 30),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Color(0x60FFFFFF),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 15
                        ),
                        hintText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Color(0x60FFFFFF),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 15
                        ),
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value : checkValue,
                        onChanged: (bool value){
                          setState(() {
                            checkValue = value;
                          });
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Color(0xFFE19600),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FlatButton(
                      child: Text('LOG IN',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/home');
                        // CryptoApiService cas = new CryptoApiService();
                        // cas.getNames();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 20,
              color: Colors.white24,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      "Don't you have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        'Sign up!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
