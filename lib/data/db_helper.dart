import 'dart:io';

import 'package:cryptoapp/data/model/Favorite.dart';
import 'package:cryptoapp/data/model/Investment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper{

  static Database _database;
  static DBHelper _dbHelper;

  String favoritesTable = 'favorites_table';
  String investmentTable = 'investment_table';

  String colId = 'id';
  String colTitle = 'title';
  String colAmount = 'amount';


  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  DBHelper._createInstance();

  factory DBHelper() {

    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance(); // This is executed only once, singleton object
    }
    return _dbHelper;
  }


  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cryptodatabase.db';

    var database = await openDatabase(
        path,
        version: 1,
        onCreate: _createDB
    );

    return database;
  }

  void _createDB(Database database,int newVersion) async{
    await database.execute('''
      CREATE TABLE $favoritesTable(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colTitle TEXT NOT NULL
      )
    ''');

    await database.execute('''
      CREATE TABLE $investmentTable(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colTitle TEXT NOT NULL,
      $colAmount TEXT NOT NULL
      )
    ''');
  }

  // Fetch Operation: Get all investment objects from database
  Future<List<Map<String, dynamic>>> getInvestmentMapList() async {
    Database db = await this.database;

    var result = await db.query(investmentTable);
    return result;
  }

  // Insert Operation: Insert a Investment object to database
  Future<int> insertInvestment(Investment investment) async {
    Database db = await this.database;
    var result = await db.insert(investmentTable, investment.toMap());

    print("insertInvestment = ${investment.currency}, result= $result");
    return result;
  }

  // Update Operation: Update a Investment object and save it to database
  Future<int> updateInvestment(Investment investment) async {
    var db = await this.database;
    var result = await db.update(investmentTable, investment.toMap(), where: '$colId = ?', whereArgs: [investment.id]);
    return result;
  }

  // Delete Operation: Delete a Investment object from database
  Future<int> deleteInvestment(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $investmentTable WHERE $colId = $id');

    print("deleteInvestment = $id");
    return result;
  }

  // Get number of Investment objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $investmentTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Investment List' [ List<Investment> ]
  Future<List<Investment>> getInvestmentList() async {

    var investmentMapList = await getInvestmentMapList(); // Get 'Map List' from database
    int count = investmentMapList.length;         // Count the number of map entries in db table

    List<Investment> investmentList = List<Investment>();
    // For loop to create a 'Investment List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      investmentList.add(Investment.fromMapObject(investmentMapList[i]));
    }

    return investmentList;
  }


  //////////////////////////// FAVORITES //////////////////////////////

  // Fetch Operation: Get all favorite objects from database
  Future<List<Map<String, dynamic>>> getFavoritesMapList() async {
    Database db = await this.database;

    var result = await db.query(favoritesTable);
    return result;
  }

  // Insert Operation: Insert a Favorite object to database
  Future<int> insertFavorite(Favorite favorite) async {
    Database db = await this.database;
    var result = await db.insert(favoritesTable, favorite.toMap());

    print("insertFavorite = ${favorite.title}, result= $result");
    return result;
  }

  // Update Operation: Update a Favorite object and save it to database
  Future<int> updateFavorite(Favorite favorite) async {
    var db = await this.database;
    var result = await db.update(favoritesTable, favorite.toMap(), where: '$colId = ?', whereArgs: [favorite.id]);
    return result;
  }

  // Delete Operation: Delete a Favorite object from database
  Future<int> deleteFavorite(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $favoritesTable WHERE $colId = $id');

    print("deleteFavorite = $id");
    return result;
  }

  // Get number of Favorites objects in database
  Future<int> getCountFavorites() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $favoritesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Favorite List' [ List<Favorite> ]
  Future<List<Favorite>> getFavoritesList() async {

    var favoritesMapList = await getFavoritesMapList(); // Get 'Map List' from database
    int count = favoritesMapList.length;         // Count the number of map entries in db table

    List<Favorite> favoritesList = List<Favorite>();
    // For loop to create a 'Favorite List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      favoritesList.add(Favorite.fromMapObject(favoritesMapList[i]));
    }

    return favoritesList;
  }
}