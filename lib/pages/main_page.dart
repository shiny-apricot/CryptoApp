import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/currencyValues.dart';
import 'package:cryptoapp/data/services/crypto_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


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
  bool isLoading = true;

  @override
  void initState() {
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
                    height: 55,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: new BoxDecoration(
                      color: Color(0x35D3D3D3),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      trailing: Icon(
                        FontAwesomeIcons.liraSign,
                        color: Colors.red,
                        size: 20,
                      ),
                      title: Text(
                        'Main Currency',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                ),
                Divider(height: 25,thickness: 1,color: Colors.grey[800], indent: 25, endIndent: 25),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 55,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: new BoxDecoration(
                    color: Color(0xFF003941),
                    borderRadius: new BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.search, color: Colors.white),
                    title: TextField(
                          controller: searchedString,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'Search...',
                            border:InputBorder.none,
                          ),
                          onSubmitted: (text)
                          {
                            var searchResult = cv.search(text);
                            StringBuffer sb = StringBuffer();
                            int count =0;
                            print('CHECKPOINT 4');
                            for(int i=0; i<searchResult.length; i++)
                            {
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
                            print('CHECKPOINT 1');
                            setState(() {});
                          },
                        ),
                  )
                ),
                SizedBox(
                  height:20,
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF003942),
                    child:
                    /* ==================FUTURE BUILDER ===================== */
                    FutureBuilder(
                        future: cas.getObjects(),
                        builder: (context, snapshot)
                        {
                          print('CHECKPOINT 2');
                          List cryptoList = snapshot.data;
                          int length;
                          if(cryptoList != null) {
                            length = cryptoList.length;
                            print('future length = $length');
                          }

                          if(snapshot.connectionState == ConnectionState.done)
                          {
                            return ListView.separated(
                                    itemCount: length,
                                    itemBuilder: (context,index){
                                      Currency element = cryptoList[index];
                                      return Container(
                                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        decoration: new BoxDecoration(
                                          color: Color(0xFF002B32),
                                          borderRadius: new BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: ListTile(
                                          // contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                          // tileColor: Color(0xFF002B32),
                                          leading: pullTheImageIfExist(element), /////
                                          title:
                                          Container(
                                            height: 40,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              element.name,
                                              style: TextStyle(
                                                color:Colors.amberAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                          ),
                                          subtitle: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 30,
                                            child: Text('${element.price} ',
                                              style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          trailing: Icon(
                                              Icons.favorite_border,
                                            color: Colors.redAccent,
                                            size: 33,
                                          )
                                        ),
                                      );
                                    },
                              separatorBuilder: (BuildContext context, int index){
                                      return Divider(
                                        color: Colors.transparent,
                                        height: 2,
                                      );
                              }
                                    );
                          }
                          if(snapshot.hasError){
                            return Container(
                              child: Icon(
                                Icons.icecream,
                              ),
                            );
                          }
                          else{
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
                // SizedBox(
                //   height: 40,
                // ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    thickness: 1,
                    height: 1,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          );
  }

  Widget pullTheImageIfExist(Currency element) {

    // print('#### element = ${element.logoUrl} ');
    if(element.logoUrl == null || element.logoUrl == ''){
      return Icon(
          MdiIcons.bitcoin,
        color: Colors.amber,
      );
    }
    else {
      String lastThreeLetter = element.logoUrl.substring(element.logoUrl.length - 3);
      if(lastThreeLetter == 'svg'){
      return Container(
        height: 45,
        width: 45,
        decoration: new BoxDecoration(
            color: Colors.grey[200],
          shape: BoxShape.circle
        ),
        child: SvgPicture.network(
            "${element.logoUrl}",
          alignment: AlignmentDirectional.centerStart,
          width: 35,
          height: 35,
          fit: BoxFit.fill,
        ),
      );
      }else{
      return Container(
        height: 45,
        width: 45,
        decoration: new BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle
        ),
        child: Image.network(
          "${element.logoUrl}",
          width: 35,
          height: 35,
        ),
      );
      }
    }
  }
}

