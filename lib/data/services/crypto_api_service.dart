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

  String attributeUrl = "https://api.nomics.com/v1/currencies?key=867f3e9becebffbaba68fa386bcf22bd&";
  String tickerUrl =    "https://api.nomics.com/v1/currencies/ticker?key=867f3e9becebffbaba68fa386bcf22bd&";

  Future<List> getObjects() async{
    print('== Get Currencies ==');

    StringBuffer sb = StringBuffer();

    if(attributes != null){
      print('attributes = $attributes');
      sb.write("${attributeUrl}attributes=$attributes");
      if(ids != null)
        sb.write("&ids=$ids");

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

    List<Currency> objectList = List<Currency>();

    for(int i=0; i<length; i++){

      String id = responseList[i]['id'];
      double price = responseList[i]['price'];
      int rank = responseList[i]['rank'];
      String name = responseList[i]['name'];
      String logoUrl = responseList[i]['logo-url'];

      Currency currency = Currency(id=id,name=name,price=price,rank=rank,logoUrl=logoUrl);
      objectList.add(currency);
    }

    return objectList;
  }

  Future<List> getNames() async{
    String url = "https://api.nomics.com/v1/currencies?key=867f3e9becebffbaba68fa386bcf22bd&attributes=id";
    List data = await ws.getData(url);
    StringBuffer sb = new StringBuffer();
    print(data.length);
    sb.write("[");

    for(int i=0; i<data.length; i++){
      sb.write("'${data[i]['id']}',");
    }

    String dataString = sb.toString();
    log(dataString);
  }

  Future<List> getSortedNames() async{
    String url = "https://api.nomics.com/v1/currencies/ticker?key=867f3e9becebffbaba68fa386bcf22bd&sort=rank";
    List data = await ws.getData(url);
    StringBuffer sb = new StringBuffer();
    print(data.length);
    sb.write("[");

    for(int i=0; i<data.length; i++){
      sb.write("'${data[i]['id']}',");
    }

    String dataString = sb.toString();
    log(dataString);
  }
}