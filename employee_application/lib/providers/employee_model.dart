import 'package:employee_application/models/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class EmployeeModel extends ChangeNotifier {
  List<Employee> _itEmployees;
  List<Employee> _hrEmployees;

  void setEmployees(List<Employee> employees) {
    _itEmployees = employees.where((element) => element.category == EmployeeCategory.IT).toList();
    _hrEmployees = employees.where((element) => element.category == EmployeeCategory.HR).toList();
    notifyListeners();
  }

  List<Employee> get itEmployees => _itEmployees;

  List<Employee> get hrEmployees => _hrEmployees;
}
