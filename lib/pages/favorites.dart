import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  bool isPressed = false;
  bool isPressed1 = false;
  bool isPressed2 = false;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color:  Color(0xFF003942),
              child: ListView(
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
                          color: (isPressed) ? Colors.white : Colors.red,
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

                        leading: Icon(FontAwesomeIcons.euroSign,
                          color: Colors.green,
                        ),
                        trailing: Icon(FontAwesomeIcons.solidHeart,
                          color:(isPressed1) ? Colors.white : Colors.red,
                        ),
                        title: Text('Euro                   9.05',
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
                          color: (isPressed2) ? Colors.white : Colors.red,
                        ),
                        title: Text('Dollar                 7.64',
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
