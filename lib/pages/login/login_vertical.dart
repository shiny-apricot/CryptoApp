import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/data/currencyValues.dart';
import 'package:cryptoapp/data/db_helper.dart';
import 'package:cryptoapp/data/model/Favorite.dart';
import 'package:cryptoapp/data/model/Investment.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:cryptoapp/pages/login/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginVertical extends StatefulWidget {
  @override
  _LoginVerticalState createState() => _LoginVerticalState();
}

class _LoginVerticalState extends State<LoginVertical> {
  @override
  void initState(){
    super.initState();
    getSharedPrefences();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkValue = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body:Container(
      alignment: Alignment.center,
      color: Color(0xFF003942),
      child:Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              alignment: Alignment.center,
              child: Text(
                'Crypto App',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(top: 20,right: 30, left: 30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      margin: EdgeInsets.only(top: 20),
                      decoration: new BoxDecoration(
                        color: Color(0x60FFFFFF),
                        borderRadius: new BorderRadius.all(Radius.circular(10)),
                      ),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (String val){
                            if(val.isEmpty){
                              return "Please enter a mail";
                            }
                            return null;
                          },
                          decoration: InputDecoration.collapsed(
                            hintStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: 15
                            ),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),

                    ),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        margin: EdgeInsets.only(top: 20),
                        decoration: new BoxDecoration(
                          color: Color(0x60FFFFFF),
                          borderRadius: new BorderRadius.all(Radius.circular(10)),
                        ),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            validator: (String val){
                              if(val.isEmpty){
                                return "Please enter a password";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 15
                              ),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value : checkValue,
                          onChanged: (bool value){
                            setState(() {
                              checkValue = value;
                            });
                          },
                        ),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      decoration: new BoxDecoration(
                        color: Color(0xFFE19600),
                        borderRadius: new BorderRadius.all(Radius.circular(10)),
                      ),
                      child: FlatButton(
                        minWidth: 280,
                        height: 50,
                        child: Text('LOG IN',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          if(_formkey.currentState.validate()){
                            if(checkValue)
                              setSharedPreferences(checkValue, _emailController.text, _passwordController.text);
                            _login();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 20,
              color: Colors.white24,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      "Don't you have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        'Sign up!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    ) );
  }
  void _login() async{
    try{
      final User user = (
      await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
      if(!user.emailVerified){
      await user.sendEmailVerification();
      }
      Navigator.of(context).pushNamed('/home');
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Logged in successfully")));
      getDataFromFirebaseAndInsertToDatabase();
      getInvestmentsAndInsertDatabase();

    } catch (e){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Failed to Login e= $e")));
    }
  }

  void getDataFromFirebaseAndInsertToDatabase() async{
    DBHelper dbhelper = DBHelper();
    await Firebase.initializeApp();

    List favorites = await getFavorites();

    List favoritesListInDatabase = await dbhelper.getFavoritesList();
    List favoritesCurrencyList = List();

    for(Favorite favorite in favoritesListInDatabase){
      favoritesCurrencyList.add(favorite.currency);
    }

    for(String element in favorites)
    {
      print('element = '+element);
      if(!favoritesCurrencyList.contains(element)) {
        Favorite newFavorite = Favorite(null, element);
        print('$element is not in the database...');
        await dbhelper.insertFavorite(newFavorite);
      }
    }
  }


  getSharedPrefences() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState((){
      checkValue= preferences.getBool("Bool")?? false;
      _emailController.text = preferences.getString("String")??"";
      _passwordController.text = preferences.getString("String2")??"";
    });
  }

  setSharedPreferences(bool checkbox,String email,String password) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("String", email);
    await preferences.setString("String2", password);
    await preferences.setBool("Bool", checkbox);
  }

  Future<List<String>> getFavorites() async {
    CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');

    List<String> favoritesList = List<String>();

    var snapshot = await favorites.get();
    print('');
    print('## SNAPSHOT HAS TAKEN ##');
    print('');
    snapshot.docs.forEach((element) {
      String name = element['id'];
      print('$name');
      favoritesList.add(name);
    });
    print('');
    print('## RETURN GAMELIST ##');
    print('');
    return favoritesList;
  }

  Future<void> getInvestmentsAndInsertDatabase() async {
    DBHelper dbhelper = DBHelper();
    CollectionReference investmentCollection = FirebaseFirestore.instance.collection('investments');

    var snapshot = await investmentCollection.get();
    print('');
    print('## SNAPSHOT HAS TAKEN ##');
    print('');

    dbhelper.deleteAllInvestment();
    print('ALL INVESTMENTS IN DATABASE DELETED');

    snapshot.docs.forEach((element) {
      String count = element['count'];
      String currency = element['currency'];
      String initial=  element['initial_value'];
      print('$count $currency $initial');

      Investment investment = Investment(null, currency, count, initial);
      dbhelper.insertInvestment(investment);
    });

  }

}




