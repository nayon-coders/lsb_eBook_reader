import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/main.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  //get api
  static Future<http.Response> getApi(String url) async {
    var data = await http.get(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      }
    );

    print("GET API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("GET API RESPONSE URL: ${url}");
    print("GET API RESPONSE BODY: ${data.body}");
    print("GET API RESPONSE STATUS CODE: ${data.statusCode}");

    return data;
  }


  //post api
  static Future<http.Response> postApi(String url, dynamic body) async {
    return await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      },
      body: jsonEncode(body)
    );
  }


  //put api
  static Future<http.Response> putApi(String url, dynamic body) async {
    return await http.put(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      },
      body: jsonEncode(body)
    );
  }


  //delete api
  static Future<http.Response> deleteApi(String url) async {
    var data = await http.delete(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      }
    );
    print("DELETE API RESPONSE TOKEN: ${url}");
    print("DELETE API RESPONSE RESPONSE: ${data.body}");
    print("DELETE API RESPONSE RESPONSE: ${data.statusCode}");

    return data;

  }



  //post api without token
  static Future<http.Response> postApiWithoutToken(String url, dynamic body) async {
    return await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body)
    );
  }

}