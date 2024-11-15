import 'package:alice_get_connect/base_interceptor.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/data/_core/app_exceptions.dart';
import 'package:xsis/data/_core/models/response_model.dart';

class ApiBaseHelper {
  final GetHttpClient client;
  final List<BaseInterceptor> interceptors;

  ApiBaseHelper({required this.client, this.interceptors = const []}) {
    client.baseUrl = AppFlavor.instance.baseUrl;
    client.timeout = const Duration(
      milliseconds: AppConstant.kConnectionTimeout,
    );
    for (var interceptor in interceptors) {
      client.addRequestModifier(interceptor.requestInterceptor);
      client.addResponseModifier(interceptor.responseInterceptor);
    }
  }

  Future getApi(String url, {Map<String, String>? query}) async {
    final response = await client.get(url, query: query);
    return _handleResponse(response);
  }

  Future postApi(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? query,
    bool isFormData = false,
  }) async {
    final response = await client.post(
      url,
      body: _getBody(body, isFormData: isFormData),
      query: query,
    );
    return _handleResponse(response);
  }

  Future putApi(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? query,
    bool isFormData = false,
  }) async {
    final response = await client.put(
      url,
      body: _getBody(body, isFormData: isFormData),
      query: query,
    );
    return _handleResponse(response);
  }

  Future deleteApi(
    String url, {
    Map<String, String>? query,
    bool isFormData = false,
  }) async {
    final response = await client.delete(
      url,
      query: query,
    );
    return _handleResponse(response);
  }

  dynamic _getBody(Map<String, dynamic> body, {bool isFormData = false}) {
    bool useFormData = isFormData;
    if (body.containMultipartFile()) {
      useFormData = true;
    }
    return useFormData ? FormData(body) : body;
  }

  dynamic _handleResponse(Response response) {
    if (response.isOk) {
      return response.body;
    } else {
      if (response.isAppJson && response.body != null) {
        final resMod = ResponseModel.fromJson(response.body);
      }
      throw AppException.network(response.statusCode);
    }
  }
}

extension MapCheckingX on Map<String, dynamic> {
  bool containMultipartFile() {
    for (var value in values) {
      if (value is MultipartFile || value is List<MultipartFile>) {
        return true;
      }
    }
    return false;
  }
}

extension ResponseCheckingX on Response {
  String get contentType {
    return headers?['content-type'] ?? '';
  }

  bool get isAppJson {
    return contentType.contains('application/json');
  }
}
