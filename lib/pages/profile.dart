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
      margin: EdgeInsets.fromLTRB(20,60,0,0),
        child: Column(
          children: [
            Container(
              child: Text('Yasin İNAL',
                style:TextStyle(color: Colors.white, fontSize: 30.0))
            )
            ,
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Text('Current Currency',style:TextStyle(color: Colors.white, fontSize: 20.0,fontStyle: FontStyle.italic)
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
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: Currency,
                  icon: Icon(Icons.arrow_downward,
                    color: Colors.white,),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      Currency = newValue;
                    });
                  },
                  items: <String>['TRY', 'USD']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
              ),
            ),
            Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Text('Language',style:TextStyle(color: Colors.white, fontSize: 20.0,fontStyle: FontStyle.italic)
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
                child: DropdownButton<String>(
                  
                  dropdownColor:Colors.black ,
                  value: Language,
                  icon: Icon(Icons.arrow_downward,
                  color: Colors.white,),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      Language = newValue;
                    });
                  },
                  items: <String>['English', 'Türkçe']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
              ),


              ),



          ],




        ),

    );
  }
}
