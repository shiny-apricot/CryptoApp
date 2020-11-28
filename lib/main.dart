import 'package:cryptoapp/pages/my_investments.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/pages/main_page.dart';
import 'package:cryptoapp/custom/customAppBar.dart';
import 'package:cryptoapp/misc/route_generator.dart';

void main() {
  runApp(MaterialApp(
    title: 'CryptoApp',
    initialRoute: '/home',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int _currentIndex = 0;

  List<Widget> _bottomBarPage = <Widget>[
    Home(),
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

  List<Widget> fabList(BuildContext context) {
    return <Widget>[
      null,
      null,
      FloatingActionButton(
        backgroundColor: Color(0xFFFEAD34),
        child: Icon(
          Icons.add,
          color: Colors.grey[850],
          size: 30.0,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/addInvestment');
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xFF003942),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: DrawerHeader(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        'Crypto App',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[200]
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF002B32),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: FlatButton(
                  color: Color(0xFFFEAD34),
                  onPressed: (){
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text(
                        'My Profile',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 17
                      ),
                    ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF003942),
      body: _bottomBarPage.elementAt(_currentIndex),
      appBar: _appBarSelection.elementAt(_currentIndex),
      floatingActionButton: fabList(context).elementAt(_currentIndex),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'My Favorites'),
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



