import 'package:cryptoapp/pages/my_investments.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/pages/login.dart';
import 'package:cryptoapp/pages/main_page.dart';
import 'package:cryptoapp/custom/customAppBar.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  List<Widget> _bottomBarPage = <Widget>[
    MainPage(),
    Favorites(),
    MyInvestments(),
  ];

  List<Widget> _appBarSelection = <Widget>[
    AppBar(
      backgroundColor: Color(0xFF002B32),
    ),
    AppBar(
      backgroundColor: Color(0xFF002B32),
    ),
    CustomAppBar()
  ];

  List<Widget> _floatingActionButtonSelection = <Widget>[
    null,
    null,
    FloatingActionButton(
      onPressed: (){
      print('add investment');
    },
      backgroundColor: Color(0xFFFEAD34),
      child: Icon(
        Icons.add,
        color: Colors.grey[850],
        size: 30.0,
      ),
    )

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003942),

      body: _bottomBarPage.elementAt(_currentIndex),

      appBar: _appBarSelection.elementAt(_currentIndex),

      floatingActionButton: _floatingActionButtonSelection.elementAt(_currentIndex),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF003942),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Investments')
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}



