import 'package:cryptoapp/pages/add_investment.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/pages/login.dart';
import 'package:cryptoapp/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/home':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/addInvestment':
        return MaterialPageRoute(builder: (_) => AddInvestment());

    }
  }
}