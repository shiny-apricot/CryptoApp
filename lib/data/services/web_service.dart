import 'dart:convert';
import 'package:http/http.dart';



class WebService{
  Future<List> getData(String url) async
  {
    Response response = await get(url);
    List data = jsonDecode(response.body);

    print('');
    print('##### DATA HAS FETCHED SUCCESSFULLY !  url= $url #####');
    print('');

    return data;
  }
}