import 'dart:developer';

import 'package:cryptoapp/data/currency.dart';
import 'package:cryptoapp/data/services/web_service.dart';


class CryptoApiService{
  String ids;
  String convert;
  String sort;
  String attributes;
  int perPage;
  int page;

  CryptoApiService({this.ids, this.convert, this.sort, this.attributes,
      this.perPage, this.page});

  WebService ws = WebService();

  //This is used for calling 'attribute'.
  String attributeUrl = "https://api.nomics.com/v1/currencies?key=867f3e9becebffbaba68fa386bcf22bd&";
  //This is used for calling things other than attribute
  String tickerUrl =    "https://api.nomics.com/v1/currencies/ticker?key=867f3e9becebffbaba68fa386bcf22bd&";

  Future<List> getObjects() async{
    print('== Get Currencies ==');

    StringBuffer sb = StringBuffer();

    if(attributes != null){
      print('attributes = $attributes');
      sb.write("${attributeUrl}attributes=$attributes");
      if(ids != null)
        sb.write("ids=$ids");

      print('WEB SERVICE CALLED WITH URL= ${sb.toString()}');
      return await ws.getData(sb.toString());
    }
    else
    {
      sb.write("$tickerUrl");

      int requestCount = 0;

      if (convert != null) {
        print('== Convert to => $convert');
        sb.write('convert=$convert');
        requestCount++;
      }

      if (ids != null) {
        print('== IDS are => $ids');
        sb.write('ids=$ids');
        if (requestCount > 0) {
          sb.write('&');
        }
        requestCount++;
      }

      if (sort != null) {
        print('== sort...');
        if (requestCount > 0) {
          sb.write('&');
        }
        sb.write('sort=$sort');
        requestCount++;
      }

      if (perPage != null) {
        print('== Per Page => $perPage');
        if (requestCount > 0) {
          sb.write('&');
        }
        sb.write('per-page=$perPage');
        requestCount++;
      }

      if (page != null) {
        print('== Page => $page');
        if (requestCount > 0) {
          sb.write('&');
        }
        sb.write('page=$page');
        requestCount++;
      }
    }


    print('==> WEB SERVICE CALLED WITH URL ==> ${sb.toString()}');
    List responseList = await ws.getData(sb.toString());
    int length = responseList.length;
    print('length of api = $length');

    List objectList = List();


    for(int i=0; i<length; i++){
      String id = responseList[i]['id'];
      print(id); //DEBUG PURPOSE
      String price = responseList[i]['price'];
      print(price); //DEBUG PURPOSE
      String rank = responseList[i]['rank'];
      print(rank); //DEBUG PURPOSE
      String name = responseList[i]['name'];
      print(name); //DEBUG PURPOSE
      String logoUrl = responseList[i]['logo_url'];
      print(logoUrl); //DEBUG PURPOSE

      Currency currency = Currency(id=id,name=name,price=price,rank=rank,logoUrl=logoUrl);
      print('for i = $i'); //DEBUG PURPOSE
      print(currency.name); //DEBUG PURPOSE
      objectList.add(currency);

    }

    return objectList;
  }

  // Future<List> getNames() async{
  //   String url = "https://api.nomics.com/v1/currencies?key=867f3e9becebffbaba68fa386bcf22bd&attributes=id";
  //   List data = await ws.getData(url);
  //   StringBuffer sb = new StringBuffer();
  //   print(data.length);
  //   sb.write("[");
  //
  //   for(int i=0; i<data.length; i++){
  //     sb.write("'${data[i]['id']}',");
  //   }
  //
  //   String dataString = sb.toString();
  //   log(dataString);
  // }
  //
  // Future<List> getSortedNames() async{
  //   String url = "https://api.nomics.com/v1/currencies/ticker?key=867f3e9becebffbaba68fa386bcf22bd&sort=rank";
  //   List data = await ws.getData(url);
  //   StringBuffer sb = new StringBuffer();
  //   print(data.length);
  //   sb.write("[");
  //
  //   for(int i=0; i<data.length; i++){
  //     sb.write("'${data[i]['id']}',");
  //   }
  //
  //   String dataString = sb.toString();
  //   log(dataString);
  // }
}