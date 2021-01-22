import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/db_helper.dart';
import 'package:cryptoapp/data/model/Favorite.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  DBHelper dbhelper = DBHelper();
  List favorites;

  Future<List> favoritesList() async{
    favorites = await dbhelper.getFavoritesList();
    return favorites;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color:  Color(0xFF003942),
              child: FutureBuilder(
                future: favoritesList(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.done)
                  {
                    if(snapshot.hasData) {
                      List favoritesData = snapshot.data;
                      return ListView.builder(
                          itemCount: favoritesData.length,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            CryptoApiService apiService;
                            Favorite favorite = favoritesData[index];
                            String currency = favorite.currency;

                            apiService =CryptoApiService(ids: '$currency');

                            return FutureBuilder(
                              future: apiService.getObjects(),
                              builder: (context, apiSnapshot) {
                                if (apiSnapshot.connectionState ==
                                    ConnectionState.done) {
                                  List currencyTempList = apiSnapshot.data;
                                  Currency currencyElement = currencyTempList[0];
                                    return Card(
                                      color: Color(0xFF003942),
                                      child: ListTile(
                                        onTap: (){
                                          Favorite favorite = favoritesData[index];
                                          dbhelper.deleteFavorite(favorite.id).then(
                                                  (value) => setState(() {})
                                          );
                                          deleteFavorites(favorite.id);
                                        },
                                        leading: Icon(FontAwesomeIcons.coins,
                                          color: Colors.orange,
                                        ),
                                        trailing: Icon(
                                          Icons.favorite_outlined,
                                          color: Colors.redAccent,
                                        ),
                                        title: Text(
                                          '${currencyElement.name}              ${currencyElement.price}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )
                                  );
                                } else if (apiSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                else {
                                  return Text("error");
                                }
                              },
                            );
                          }
                      );
                    }
                    else{
                      return Center(child: Text("No Favorites.."));
                    }
                }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
              }
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Divider(
              thickness: 0.5,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteFavorites(int id) async{
    print('delete $id');
    DocumentReference investments = FirebaseFirestore.instance.collection('favorites').doc('$id');
    investments.delete();
  }
}
