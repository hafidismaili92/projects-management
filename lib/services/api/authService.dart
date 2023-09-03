import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project_management/constants/api_constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:project_management/models/apiResponse.dart';
import 'package:project_management/models/user.dart';
import 'package:project_management/services/api/apiClient.dart';

class AuthService {
  ApiClient apiClient;
  AuthService({required this.apiClient});
  void login(String username, String password,
      [Function? onSuccess, Function? onFail]) async {
    final storage = FlutterSecureStorage();
    String loginEndPoint;

    if (kIsWeb) {
      loginEndPoint = kloginSpaEP;
    } else {
      loginEndPoint = kloginTokenEP;
    }
    ApiResponse apiRes = await apiClient.sendRequest(
        "post", loginEndPoint, {'email': username, 'password': password}, null);
    if (apiRes.error == '') {
      Map<String, dynamic> dta = apiRes!.data as Map<String, dynamic>;

      await storage.write(
          key: 'authToken',
          value: dta.containsKey('token') ? dta['token'] : '');
      if (onSuccess != null) {
        onSuccess(apiRes);
      }
    } else if (onFail != null) {
      onFail(apiRes);
    }
  }

  void logout([Function? onSuccess, Function? onFail]) async {
    String logoutEndPoint;
    final storage = FlutterSecureStorage();
    if (kIsWeb) {
      logoutEndPoint = klogoutSpaEP;
    } else {
      logoutEndPoint = klogoutTokenEP;
    }
    ApiResponse apiRes =
        await apiClient.sendRequest("post", logoutEndPoint, null, null);
    if (apiRes.error == '') {
      Map<String, dynamic> dta = apiRes!.data as Map<String, dynamic>;
      bool keyExist = await storage.containsKey(key: 'authToken');
      if (keyExist) {
        await storage.delete(key: 'authToken');
      }
      await storage.write(
          key: 'authToken',
          value: dta.containsKey('token') ? dta['token'] : '');
      if (onSuccess != null) {
        onSuccess(apiRes);
      }
    } else if (onFail != null) {
      onFail(apiRes);
    }
  }

  Future<Map<String, dynamic>> getAuthenticatedUser() async {
    ApiResponse apiRes =
        await apiClient.sendRequest("get", kuserEndPoint, null, null);
    if (apiRes.error == '') {
      Map<String, dynamic> dta = apiRes!.data as Map<String, dynamic>;
      User authUser =
          User(id: dta['_id'] ?? '', email: dta['email'], name: dta['name']);

      return {
        "user": authUser,
        "error": "",
      };
    }
    return {
      "user": null,
      "error": apiRes.error,
      "serverContacted": apiRes.isServerContacSuccess
    };
  }
}
