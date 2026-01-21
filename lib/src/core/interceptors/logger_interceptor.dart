import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\n🤮🤮❌🤮🤮 ------- Failure Response Start ------- 🤮🤮❌🤮🤮\n\n");
    log("ERROR::: ${err.message}");
    log("URL::: ${err.response?.realUri}");
    if (err.requestOptions.data != null) {
      log("Request Body::: ${jsonEncode(err.requestOptions.data)}");
    }
    log("Response Code::: ${err.response?.statusCode}");
    log("Response::: ${err.response?.data}");
    log("\n🤮🤮❌🤮🤮 ------- Failure Response End ------- 🤮🤮❌🤮🤮\n\n");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\n💤💤👀💤💤 ------- Request Start ------- 💤💤👀💤💤 \n");
    log("Requesting to URL: ${options.uri}");
    log("Request Headers: ${options.headers}");
    if (options.data != null) {
      if (options.data is FormData) {
        log("Request Body::: ${options.data.fields}");
      } else {
        log("Request Body::: ${jsonEncode(options.data)}");
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case 200:
        log("\n💪💪✅💪💪 ------- Success Response Start ------- 💪💪✅💪💪 \n");
        log("URL::: ${response.realUri}");
        if (response.requestOptions.data != null) {
          if (response.requestOptions.data is FormData) {
            log("Request Body::: ${response.requestOptions.data.fields}");
          } else {
            log("Request Body::: ${jsonEncode(response.requestOptions.data)}");
          }
        }
        log("Response Code::: ${response.statusCode}");
        log("Response::: ${jsonEncode(response.data)}");
        log("\n💪💪✅💪💪 ------- Success Response End ------- 💪💪✅💪💪 \n");
    }
    super.onResponse(response, handler);
  }
}
