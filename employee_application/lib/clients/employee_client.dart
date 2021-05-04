import 'dart:convert';

import 'package:employee_application/models/employee_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Employees parseEmployeeConfig(String repsonseBody) {
  return Employees.fromJson(jsonDecode(repsonseBody));
}

class EmployeeClient {
  final String _jsonPath = 'assets/json/employees.json';

  Future<Employees> fetchEmployees() async {
    try {
      String data = await rootBundle.loadString(_jsonPath);
      return compute(parseEmployeeConfig, data);
    } catch (e) {
      print(e);
      return e;
    }
  }
}
