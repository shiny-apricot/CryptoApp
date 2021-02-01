import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:cryptoapp/pages/main_page.dart';
import 'package:cryptoapp/pages/my_investments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/custom/customAppBar.dart';
import 'package:cryptoapp/misc/route_generator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'data/db_helper.dart';
import 'data/model/Favorite.dart';
import 'data/services/crypto_api_service.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void callbackDispatcher() {

  Workmanager.executeTask((taskName, inputData) async {
    String description = "";

    CryptoApiService apiService;

    DBHelper dbhelper = DBHelper();
    List favorites = await dbhelper.getFavoritesList();
    List<String> favoriteList = List();


    for(Favorite favorite in favorites)
    {
      String currency = favorite.currency;
      favoriteList.add(currency);
    }

    print('favorites length = ${favoriteList.length}');

    for(String currency in favoriteList)
    {
      apiService = CryptoApiService(ids: "$currency");
      List list = await apiService.getObjects();

      String price = list[0].price;

      print('SERVICE PRICE = $price');
      print('SERVICE CURRENCY = $currency');

      description += "$currency = $price \n";
    }


    var androidInitialize = new AndroidInitializationSettings('flutter_devs');
    var iOsInitialize = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOsInitialize);

    FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();
    fln.initialize(initializationSettings);
    var android = AndroidNotificationDetails(
        'id',
        'name',
        'description',
        icon: 'flutter_devs',
        priority: Priority.high,
        importance: Importance.max,
        playSound: true
    );

    var iOs = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: android,
        iOS: iOs,
        macOS: null
    );

    if(favoriteList.length != 0) {
      fln.show(44, 'DAILY CRYPTO', description, platformChannelSpecifics);
      print('NOTIFICATION');
    }
    print(description);

    return Future.value(true);
  });
}


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  Workmanager.cancelAll();

  Workmanager.initialize(callbackDispatcher);
  print('=============================');
  print('WORK MANAGER INITIALIZED ====');
  print('=============================');

  Workmanager.registerPeriodicTask(
      "211321",
      "task",
      existingWorkPolicy:  ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15),
      initialDelay: Duration(seconds: 5)
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CryptoApp',
    initialRoute: '/login',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int _currentIndex = 0;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState(){
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());

        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }



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
          Navigator.of(context).pushNamed('/addInvestment').then((value) {setState(() {});});
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _scaffoldKey,
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
                      'Notify Me',
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 17
                      ),
                    ),
                  ),
                ),
              )
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
        backgroundColor: Color(0xFF002B32),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
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



