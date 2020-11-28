import 'package:flutter/material.dart';

class LoginHorizontal extends StatefulWidget {
  @override
  _LoginHorizontalState createState() => _LoginHorizontalState();
}

class _LoginHorizontalState extends State<LoginHorizontal> {

  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFF003942),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
            alignment: Alignment.center,
            child: Text(
              'Crypto App',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,right: 30, left: 30),
            child: Column(
              children: [
                Container(
                  height: 50,
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
                  height: 50,
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
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0),
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
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
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
        ],
      ),
    );
  }
}
