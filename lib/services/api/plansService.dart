import 'dart:convert';

import 'package:project_management/models/apiResponse.dart';
import 'package:project_management/models/plan.dart';
import 'package:project_management/services/api/apiClient.dart';

class PlansService {
  ApiClient apiClient;
  PlansService({required this.apiClient});

  Future<Map<String, dynamic>> fetchUserPlans(int page) async {
    ApiResponse resp =
        await apiClient.sendRequest('get', '/plans?page=$page', null, null);
    if (resp.error == '') {
      Map<String, dynamic> dta = resp!.data as Map<String, dynamic>;
      List<dynamic> plans = dta["data"];
      List<Plan> planObjects =
          plans.map((plan) => Plan.fromJson(plan)).toList();
      return {"error": '', "plans": planObjects, "total": dta["total"]};
    } else {
      return {
        "error": resp.error,
      };
    }
  }
}
