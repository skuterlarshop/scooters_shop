import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import '../storage/app_storage.dart';

class AppInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (kDebugMode) {
    log(
    "---------[Interceptor]---------ON_REQUEST(${request.method})------------------\n\n"
        "URL: ${request.url}\n"
        "HEADERS: ${request.headers}\n"
        "---------------------------------------------------------------------------\n\n",
    );
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    if (kDebugMode) {
      log(
        "---------[Interceptor]---------ON_RESPONSE(${response.statusCode})------------------\n\n"
            "HEADERS: ${response.headers}\n"
            "BODY: ${response.request}\n"
            "---------------------------------------------------------------------------\n\n",
      );
    }


    if (response.statusCode == 401) {
      /// 1. eskirgan access va refreshni hotiradan olamiz
      String? access = await AppStorage.load(key: StorageKey.accessToken);
      String? refresh = await AppStorage.load(key: StorageKey.refreshToken);


      /// 2. tokenni yangilaydigan function
      /// 3. Xotiraga yangi tokenlarni yozamiz
      await AppStorage.store(key: StorageKey.accessToken, value: "value");
      await AppStorage.store(key: StorageKey.refreshToken, value: "value");

      /// 4. Davom etish...


      final Map<String, String> updatedHeaders = {
        "Authorization": "Bearer NEWACCESS",
      };

      response.request?.headers.forEach((key, value) {
        updatedHeaders[key] = value;
      });

      response.request?.headers.addAll(updatedHeaders);

      final newRequest = http.Request(response.request!.method, response.request!.url
      );

      final retryResponse = await http.Client().send(newRequest);

      await http.Response.fromStream(retryResponse);

    }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() {
    // TODO: implement shouldInterceptRequest
    throw UnimplementedError();
  }

  @override
  Future<bool> shouldInterceptResponse() {
    // TODO: implement shouldInterceptResponse
    throw UnimplementedError();
  }



}