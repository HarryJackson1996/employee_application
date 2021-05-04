// To parse this JSON data, do
//
//     final employees = employeesFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'employee_model.g.dart';

Employees employeesFromJson(String str) => Employees.fromJson(json.decode(str));

String employeesToJson(Employees data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Employees extends HiveObject {
  Employees({
    this.employees,
  });

  @HiveField(0)
  final List<Employee> employees;

  Employees copyWith({
    List<Employee> employees,
  }) =>
      Employees(
        employees: employees ?? this.employees,
      );

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        employees: json["employees"] == null ? null : List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "employees": employees == null ? null : List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class Employee extends HiveObject {
  Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.category,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final EmployeeCategory category;

  Employee copyWith({
    int id,
    String firstName,
    String lastName,
    EmployeeCategory category,
  }) =>
      Employee(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        category: category ?? this.category,
      );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        category: json["category"] == null ? null : categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "category": category == null ? null : categoryValues.reverse[category],
      };
}

@HiveType(typeId: 2)
enum EmployeeCategory {
  @HiveField(0)
  IT,
  @HiveField(1)
  HR,
}

final categoryValues = EnumValues({"HR": EmployeeCategory.HR, "IT": EmployeeCategory.IT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
