import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

import 'package:project_management/models/apiResponse.dart';

class ApiClient {
  String baseUrl;
  static Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  final Dio _dio;

  ApiClient({required this.baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: Duration(milliseconds: 10000),
          receiveTimeout: Duration(milliseconds: 10000),
        ));

  void setupWebClient() {
    this
        ._dio
        .interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.extra["withCredentials"] = true;
      return handler.next(options);
    }));
  }

  Future<ApiResponse> sendRequest(String type, String endPoint,
      Map<String, dynamic>? data, Map<String, String>? extraHeaders) async {
    final url = '$baseUrl$endPoint';

    ApiResponse resp = ApiResponse();
    Map<String, dynamic> requestHeaders =
        extraHeaders != null ? {..._headers, ...extraHeaders} : _headers;
    // always add the barreer token if exist
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    if (token != null) {
      requestHeaders['Authorization'] = 'Bearer $token';
    }

    try {
      Future<Response>? request;
      switch (type) {
        case "post":
          {
            request = _dio.post(url,
                data: data != null ? jsonEncode(data) : null,
                options: Options(headers: requestHeaders));
          }
          break;
        case "get":
          {
            request = _dio.get(url, options: Options(headers: requestHeaders));
          }
      }
      if (request != null) {
        var serverResp = await request;

        resp.data = serverResp.data;
      } else {
        resp.error = "undefined request type";
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        resp.isServerContacSuccess = false;
        resp.error = "bad request";
      } else if (e.type == DioExceptionType.badResponse) {
        resp.error = "bad request";
        resp.error = "bad request (status ${e.response!.statusCode})";
      } else {
        resp.error = "Unexcpected Error";
      }
    }
    return resp;
  }
}
