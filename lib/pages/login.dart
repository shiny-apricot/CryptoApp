import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,

        body: Container(
          color: Color(0xFF003942),
          width: double.infinity,


                 child:Column(

                   children: <Widget>[
                     SizedBox(
                       height: 300,
                     ),
                     Align(
                     child:Container(
                       height: 50,
                       width: 250,

                       margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                       decoration: new BoxDecoration(
                         color: Color(0xFFAED6F1 ),
                         borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20,top: 20),
                          child: TextField(
                           decoration: InputDecoration.collapsed(
                             hintStyle: TextStyle(
                                 color: Colors.black26,
                             ),
                             hintText: 'Username',
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                      ),
                     ),


                    Align(
                      child: Container(
                       height: 50,
                       width: 250,
                       margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                       decoration: new BoxDecoration(
                         color: Color(0xFFAED6F1 ),
                         borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20,top: 20),
                          child: TextField(
                           decoration: InputDecoration(
                             hintStyle: TextStyle(
                               color: Colors.black26,
                             ),
                             hintText: 'Password',
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                    ),
                     SizedBox(
                       height: 10,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 180.0),
                           child: Row(
                             children: [
                               Checkbox(

                                 value : checkValue,
                                 onChanged: (bool value){

                                   setState(() {
                                     checkValue = value;
                                   });
                                 },
                               ),
                               Text('remember me',
                               style: TextStyle(
                                 color: Colors.white,
                               ),
                               ),
                             ],
                           ),
                        /* child: Text(
                           'Remember me',
                           style: TextStyle(
                             color: Colors.white,

                           ),
                         ),*/
                       ),

                     SizedBox(
                       height: 1,
                     ),
                     Align(
                      child:Container(
                        height: 50,
                        width: 180,

                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: new BoxDecoration(
                          color: Color(0xFFE19600),
                          borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                        ),
                       child: FlatButton(
                          child: Text('LOG IN',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              color: Colors.black,
                              ),
                          ),
                        onPressed: (){
                          Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => Home(),
                            ));
                          },
                        ),
                      ),
                     ),

                  SizedBox(
                    height: 160,
                  ),
                 Expanded(

                   child: Container(
                      width: double.infinity,
                        height: 100,
                         color: Color(0xFF01ACC4),
                          child: Row(
                            children:<Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 50),

                                  child:Text(
                                    "Don't you have an account?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),


                              ),
                              Expanded(
                                child:TextButton(
                                  child: Text(
                                    'Sign up!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ]



                     ),


                   ),
                 ),

                   ],

                 ),

                            /*child: Container(
                              height: 50,
                              width: 250,
                              color: Colors.greenAccent,
                                child: TextField(
                                  decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                  color: Colors.blue
                                  ),
                                  hintText: 'Name',
                                ),
                               ),
                             ),
                          ),

                        Container(
                        height: 50,
                        width: 250,
                        color: Colors.greenAccent,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.blue
                            ),
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        color: Colors.greenAccent,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.blue
                            ),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        color: Colors.amber,
                        child: FlatButton(

                          child: Text('Login',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                          },
                        ),
                ),*/









          ),

    );
  }
}
