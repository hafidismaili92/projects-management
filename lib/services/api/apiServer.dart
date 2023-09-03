import 'dart:convert';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import 'package:project_management/models/apiResponse.dart';

class ApiServer {
  static String baseUrl = "http://localhost:8000/api";
  static String authToken = '';

  static void setAuthToken(token) {
    authToken = token;
  }

  /*static void setCsrfToken(csrf) {
    csrfToken = csrf;
  }*/

  static void requestCsrfToken() async {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:8000/sanctum/csrf-cookie',
      connectTimeout: Duration(milliseconds: 10000),
      receiveTimeout: Duration(milliseconds: 5000),
    );
    DioForBrowser _d = DioForBrowser(options);
    _d.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var adapter = BrowserHttpClientAdapter();
// This property will automatically set cookies
    adapter.withCredentials = true;
    _d.httpClientAdapter = adapter;
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final dio = Dio();
    dio.options.headers = headers;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.extra["withCredentials"] = true;
      return handler.next(options);
    }));
    try {
      var response = await dio.get('http://localhost:8000/sanctum/csrf-cookie');

      print(response.headers);
      if (response.statusCode == 204) {
        await dio.post('http://localhost:8000/api/spaLogin/', data: {
          'email': 'hafid.ismaili92@gmail.com',
          'password': 'hafid_1992'
        });
        await dio.get('http://localhost:8000/api/user/');

        /*if (xsrfToken != null) {
          print(xsrfToken);
          setCsrfToken(xsrfToken);
        }*/
      } else {
        print('Failed to fetch XSRF token');
      }
    } on Exception catch (e) {
      //setCsrfToken('');
    }
  }

  static Future<ApiResponse> sendRequest(
      String type, String endPoint, Map<String, dynamic>? data) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    final dio = Dio();
    dio.options.headers = headers;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.extra["withCredentials"] = true;
      return handler.next(options);
    }));
    final url = '$baseUrl/$endPoint';
    ApiResponse resp = ApiResponse();
    try {
      Future<Response>? request;
      switch (type) {
        case "post":
          {
            request =
                dio.post(url, data: data != null ? jsonEncode(data) : null);
          }
          break;
        case "get":
          {
            request = dio.get(url);
          }
      }
      if (request != null) {
        var serverResp = await request;
        resp.data = serverResp.data;
      } else {
        resp.error = "undefined request type";
      }
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout ||
          e.type == DioException.sendTimeout ||
          e.type == DioException.receiveTimeout) {
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
