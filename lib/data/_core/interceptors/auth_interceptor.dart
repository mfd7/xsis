import 'dart:async';
import 'dart:io';

import 'package:alice_get_connect/base_interceptor.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:xsis/_core/constants/app_constant.dart';

class AuthInterceptor implements BaseInterceptor {
  @override
  FutureOr<Request> requestInterceptor(Request request) {
    request.headers[HttpHeaders.acceptHeader] = "application/json";
    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${AppConstant.kToken}";
    return Future(() => request);
  }

  @override
  FutureOr responseInterceptor(Request request, Response response) {
    return Future(() => response);
  }
}
