import 'package:cryptoapp/pages/addInvestment/_main_add_investment.dart';
import 'package:cryptoapp/pages/login/login.dart';
import 'package:cryptoapp/pages/my_investments.dart';
import 'package:cryptoapp/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/main.dart';
import 'package:cryptoapp/pages/login/Register.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    print('ROUTE GENERATOR');

    final args = settings.arguments;

    switch(settings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Main());
      case '/addInvestment':
        return MaterialPageRoute(builder: (_) => AddInvestmentMain());
      case '/register':
        return MaterialPageRoute(builder: (_) => signup());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
    }
  }
}
