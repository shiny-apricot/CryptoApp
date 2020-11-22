import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPressed = false;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  bool isPressed6 = false;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        children: [
          Align(
            child: Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(top: 40, left: 40, right: 40),
              decoration: new BoxDecoration(
                color: Color(0xFF003941),
                borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                border: Border.all(color: Colors.white, width: 0.0),
              ),
                child: ListTile(
                  trailing: Icon(FontAwesomeIcons.liraSign,
                  color: Colors.red,
                  ),
                  title: Text('Selected Currency',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
            ),
          ),

          Align(
            child: Container(
              margin: EdgeInsets.only(top: 40, left: 40, right: 40),

              decoration: new BoxDecoration(

                color: Color(0xFF003941),
                borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                border: Border.all(color: Colors.white, width: 0.0),

              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                   decoration: InputDecoration(

                    hintStyle: TextStyle(
                        color: Colors.tealAccent[100],
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                    hintText: 'Search',
                    border:InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height:20,
          ),
          Expanded(

            child: Container(
              color: Color(0xFF003942),
              child: GestureDetector (child:ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                children: <Widget>[

                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed == true){
                            setState(() {
                              isPressed = false;
                            });
                          } else {
                            setState(() {
                              isPressed = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.coins,
                            color: Colors.orange,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                        color: (isPressed) ? Colors.red : Colors.white,
                        ),
                        title: Text('Bitcoin              139,147.48',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )

                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed1 == true){
                            setState(() {
                              isPressed1 = false;
                            });
                          } else {
                            setState(() {
                              isPressed1 = true;
                            });
                          }
                        },

                        leading: Icon(FontAwesomeIcons.coins,
                          color: Colors.orange
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed1) ? Colors.red : Colors.white,
                        ),

                        title: Text('Etherium',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed2 == true){
                            setState(() {
                              isPressed2 = false;
                            });
                          } else {
                            setState(() {
                              isPressed2 = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.dollarSign,
                        color: Colors.green,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed2) ? Colors.red : Colors.white,
                        ),
                        title: Text('Dollar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed3 == true){
                            setState(() {
                              isPressed3 = false;
                            });
                          } else {
                            setState(() {
                              isPressed3 = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.euroSign,
                            color: Colors.green,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed3) ? Colors.red : Colors.white,
                        ),
                        title: Text('Euro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed4 == true){
                            setState(() {
                              isPressed4 = false;
                            });
                          } else {
                            setState(() {
                              isPressed4 = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.coins,
                            color: Colors.orange,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed4) ? Colors.red : Colors.white,
                        ),
                        title: Text('ChainLink',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )

                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed5 == true){
                            setState(() {
                              isPressed5 = false;
                            });
                          } else {
                            setState(() {
                              isPressed5 = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.coins,
                            color: Colors.orange,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed5) ? Colors.red : Colors.white,
                        ),
                        title: Text('Litecoin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                  ),
                  Card(
                      color: Color(0xFF003942),
                      child: ListTile(
                        onTap: (){
                          if(isPressed6 == true){
                            setState(() {
                              isPressed6 = false;
                            });
                          } else {
                            setState(() {
                              isPressed6 = true;
                            });
                          }
                        },
                        leading: Icon(FontAwesomeIcons.coins,
                            color: Colors.orange,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color: (isPressed6) ? Colors.red : Colors.white,
                        ),
                        title: Text('Bitcoin Cash',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                  ),

                ],
              ),

              ),

              /*KODU BURAYA YAZIN*/



            ),
          ),
            SizedBox(
              height: 40,
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