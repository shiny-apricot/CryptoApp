import 'package:cryptoapp/pages/my_investments.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/pages/login.dart';
import 'package:cryptoapp/pages/main_page.dart';



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003942),
      body: _bottomBarPage.elementAt(_currentIndex),
      appBar: _appBarSelection.elementAt(_currentIndex),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double _preferredHeight = 100.0;

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xFF002B32),
                  child: Text(
                    'My Investments',
                    style: TextStyle(
                      color: Color(0xFFDBDBDB),
                      fontSize: 19.0
                    ),
                  ),
                )
            ),
            Expanded(
              child: RaisedButton(
                onPressed: (){
                },
                color: Color(0xFFFEAD34),
                child: Text(
                  'Add an Investment',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


