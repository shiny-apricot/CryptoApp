import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
// ignore: non_constant_identifier_names
String Language='English';
// ignore: non_constant_identifier_names
String Currency='TRY';

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.fromLTRB(0,60,0,0),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Text('Yasin İNAL',
                  style:TextStyle(color: Colors.white, fontSize: 50.0))
              ),
            )
            ,
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Text('Current Currency',style:TextStyle(color: Colors.white, fontSize: 25.0,fontStyle: FontStyle.italic)
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                color: Color(0x20D3D3D3),
                borderRadius: new BorderRadius.all(Radius.elliptical(20, 50)),
                border: Border.all(color: Colors.white, width: 0.0),
              ),
              width: 150,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      padding:EdgeInsets.only(left: 5),
                      child: DropdownButton<String>(
                        dropdownColor: Color(0xFF002B32),
                        value: Currency,
                        icon: Icon(Icons.arrow_downward,
                          color: Colors.white,),
                        iconSize: 24,
                        style: TextStyle(
                          fontSize: 25,
                            color: Colors.white
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            Currency = newValue;
                          });
                        },
                        items: <String>['TRY', 'USD','ETH','BTC']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: 30,
                        height: 30,

                        child: Image(
                          image: AssetImage('assets/turkishflag.jpeg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],




        ),

    );
  }
}
