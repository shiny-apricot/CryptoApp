import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/currencyValues.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchedString = new TextEditingController();
  CurrencyValues cv;
  List objects = [];
  bool isPressed = false;
  CryptoApiService cas;
  bool isSvg = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cv = new CurrencyValues();
    var currencyIdList = cv.currencyIdList;
    StringBuffer sb = StringBuffer();

    for(int i=0; i<15; i++){
      String element = currencyIdList[i];
      sb.write(element);
      if (i != 14)
        sb.write(',');
    }
    print(sb.toString());
    cas = new CryptoApiService(ids: sb.toString() );

    // List result = cv.search(searchedString.text);

    // for(int i=0; i<20; i++){
    //
    //   var data = cas.getObjects();
    //   objects.add(data);
    // }

  }
  //YUSUF ARAMA KOMUTU BURADA ISTEDIGINI ARIYON BU KOMUTLA BUNU ISTEDIGIN YERDE KULLAN

  // CurrencyValues cv = new CurrencyValues();
  // cv.search('bt');

  //SANA BI ID LISTESI DONDURUYO BU ID'LERLE API DAN ARAMA YAPACAN

  // Widget getBody(int count, ){
  //   return ListView.separated(
  //       itemCount: count,
  //       separatorBuilder:(context,index) => Divider(
  //         thickness: 0.0,
  //         height: 0.0,
  //       ),
  //       itemBuilder: (context,index){
  //
  //       });
  // }




  @override
  Widget build(BuildContext context) {
    return Container(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 60,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: new BoxDecoration(
                      color: Color(0x35D3D3D3),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      trailing: Icon(FontAwesomeIcons.liraSign,
                        color: Colors.red,
                      ),
                      title: Text('Main Currency',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                ),
                Divider(height: 45,thickness: 1,color: Colors.grey[600], indent: 25, endIndent: 25),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: new BoxDecoration(
                    color: Color(0xFF003941),
                    borderRadius: new BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: searchedString,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.tealAccent[100],
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                        hintText: 'Search...',
                        border:InputBorder.none,
                      ),
                      onSubmitted: (text){
                        var searchResult = cv.search(text);
                        StringBuffer sb = StringBuffer();

                        int count =0;
                        for(int i=0; i<searchResult.length; i++){
                          if(count < 20) {
                            String element = searchResult[i];
                            sb.write(element);
                            if (i != searchResult.length - 1)
                              sb.write(',');
                          }
                          count++;
                        }
                        print(sb.toString());
                        cas = new CryptoApiService(ids: sb.toString());

                        setState(() {

                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height:20,
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF003942),
                    child: FutureBuilder(
                        future: cas.getObjects(),
                        builder: (context, snapshot){
                          List cryptoList = snapshot.data;
                          int length = cryptoList.length;
                          print('future length = $length');

                          if(snapshot.connectionState == ConnectionState.done){
                            return ListView.builder(
                                    itemCount: length,
                                    itemBuilder: (context,index){
                                      Currency element = cryptoList[index];

                                      return ListTile(
                                        leading:
                                        "svg" == element.logoUrl.substring(element.logoUrl.length-3) ?
                                        SvgPicture.network("${element.logoUrl}",
                                        alignment:AlignmentDirectional.centerStart,
                                          width:30, height: 30,
                                          fit: BoxFit.fitWidth,

                                        ) : (Image.network("${element.logoUrl}",
                                        width: 30, height: 30,
                                        )),

                                        title:
                                        Text(element.name,
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 14,
                                        ),
                                        ),

                                        trailing:
                                            Text('${element.price} ',
                                              style: TextStyle(
                                                color:Colors.amber,
                                                fontSize: 12,
                                              ),
                                            ),
                                      );
                                    });
                          } if(snapshot.hasError){
                            return Container(
                              child: Icon(
                                Icons.icecream,
                              ),
                            );
                          } else{
                            return Center(

                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                backgroundColor:Colors.deepPurple,
                              ),
                            );
                          }
                        }
                    ),
                  ),

                ),
                SizedBox(
                  height: 40,
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


}

