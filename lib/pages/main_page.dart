import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  //YUSUF ARAMA KOMUTU BURADA ISTEDIGINI ARIYON BU KOMUTLA BUNU ISTEDIGIN YERDE KULLAN

  // CurrencyValues cv = new CurrencyValues();
  // cv.search('bt');

  //SANA BI ID LISTESI DONDURUYO BU ID'LERLE API DAN ARAMA YAPACAN

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
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: new BoxDecoration(
                color: Color(0x35D3D3D3),
                borderRadius: new BorderRadius.all(Radius.circular(10)),
              ),
                child: ListTile(
                  trailing: Icon(FontAwesomeIcons.liraSign,
                  color: Colors.red,
                  ),
                  title: Text('Main Currency',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
            ),
            Divider(height: 45,thickness: 1,color: Colors.grey[600], indent: 25, endIndent: 25),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: new BoxDecoration(
                color: Color(0xFF003941),
                borderRadius: new BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: Colors.white, width: 1),
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
                    hintText: 'Search...',
                    border:InputBorder.none,
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

                          title: Text('Etherium              2,147.48',
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
                          title: Text('Dollar                 7.64',
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
                          title: Text('ChainLink              5,532.42',
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
      ),
    );
  }
}