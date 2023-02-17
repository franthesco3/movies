import 'dart:io';

import 'package:dio/dio.dart';

import 'api_host.dart';
import 'endpoint.dart';

typedef Failure = void Function(DioError error);
typedef Success = void Function(dynamic result);

class ApiProvider {
  final Dio _dio = Dio();

  Future<void> request(
      {required Endpoint endpoint, Success? success, Failure? failure}) async {
    _dio.options.method = endpoint.method.name;
    _dio.options.headers = await ApiHost.sessionHeaders;
    _dio.options.queryParameters = endpoint.queryParameters ?? {};
    _dio.options.baseUrl = ApiHost.baseURL;
    _dio.options.contentType = endpoint.contentType ?? ContentType.json.value;

    await _dio.request(endpoint.path, data: endpoint.data).then((response) {
      success?.call(response.data);
    }).onError<DioError>((error, stackTrace) {
      failure?.call(error);
    });
  }
}
