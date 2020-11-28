import 'package:cryptoapp/pages/addInvestment/add_investment.dart';
import 'package:cryptoapp/pages/login.dart';
import 'package:cryptoapp/pages/my_investments.dart';
import 'package:cryptoapp/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Main());
      case '/addInvestment':
        return MaterialPageRoute(builder: (_) => AddInvestment());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/myInvestment':
        return MaterialPageRoute(builder: (_) => MyInvestments());
    }
  }
}