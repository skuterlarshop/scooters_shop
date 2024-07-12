import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'api_constants.dart';
import 'app_interceptor.dart';



@immutable
class Api{




  static final http = InterceptedHttp.build(
      interceptors: [
        AppInterceptor(),
      ]
  );



  /// methods

  // get
  static Future<String?>getData({required String api, required Map<String, Object?>param})async{
    Uri url = Uri.http(ApiConstants.baseUrl, api, param);
    Response response = await http.get(url);
    if(response.statusCode <= 201){
      return response.body;
    }else{
      return null;
    }
  }


  // post
  static Future<String?>postData({required String api, required Map<String, Object?>param, required Map<String, Object?> data})async{
    Uri url = Uri.http(ApiConstants.baseUrl, api, param);
    Response response = await http.post(url, body: jsonEncode(data),headers: ApiConstants.headers);
    if(response.statusCode <= 201){
      return response.body;
    }else{
      return null;
    }
  }


  // update
  static Future<String?>updateData({required String api, required Map<String, Object?>param, required Map<String, Object?> data})async{
    Uri url = Uri.http(ApiConstants.baseUrl, api, param);
    Response response = await http.put(url, body: jsonEncode(data),headers: ApiConstants.headers);
    if(response.statusCode <= 201){
      return response.body;
    }else{
      return null;
    }
  }


  // delete
  static Future<String?>deleteData({required String api, required Map<String, Object?>param, required Map<String, Object?> data})async{
    Uri url = Uri.http(ApiConstants.baseUrl, api, param);
    Response response = await http.delete(url, body: jsonEncode(data),headers: ApiConstants.headers);
    if(response.statusCode <= 201){
      return response.body;
    }else{
      return null;
    }
  }


}