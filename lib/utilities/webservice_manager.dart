import 'dart:convert';

import 'package:http/http.dart';
class WebserviceManager{

  static String BASE_URL="";


  Future<Map<dynamic,dynamic>> makeGetRequest(String url) async {
    // make GET request
    String mainUrl = BASE_URL+'/'+url;
    Response response = await get(mainUrl);
    // sample info available in response
    int statusCode = response.statusCode;
    print(mainUrl +' : ${statusCode}');
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    print('responseBody : '+json);
    Map<dynamic, dynamic> jsonMap = jsonDecode(json);

    return jsonMap;
  }


  Future<Map<dynamic,dynamic>> makePostRequest(String url, String json) async {
    // set up POST request arguments
    String mainUrl = BASE_URL+'/'+url;
    Map<String, String> headers = {"Content-type": "application/json"};
    // make POST request
    Response response = await post(mainUrl, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(mainUrl +' : $statusCode');
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print('responseBody : '+body);
    Map<dynamic, dynamic> bodyMap = jsonDecode(body);

    return bodyMap;
  }



}