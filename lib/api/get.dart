import 'dart:convert';

import 'package:lab1/model/newsapi.dart';
import 'package:lab1/static.dart';
import 'package:http/http.dart' as http;


class GetApi{

  //news api call
  static Future<NewsApi?> newsApiCall() async {
  try{
    var url = Uri.https(StaticValue.baseURL, '/v2/everything',
        {'q': 'tesla','apiKey': StaticValue.apiKey });
    var response = await http.get(url,
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cache-Control': 'no-cache,private,no-store,must-revalidate',

    });
    if (response.statusCode.toString().contains("20")) {
      var jsonResponse = json.decode(response.body);
      NewsApi newsapidata = NewsApi.fromJson(jsonResponse);
      return newsapidata;
    } else {
      return null;
    }
  }catch(e){
    return null;
  }
  }
}