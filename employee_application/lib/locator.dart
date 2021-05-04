import 'package:employee_application/clients/employee_client.dart';
import 'package:employee_application/consts/box_consts.dart';
import 'package:employee_application/repositories/employee_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'models/employee_model.dart';

final getIt = GetIt.instance;

void setup(Box<Employees> employeesBox) {
  getIt.registerSingleton<EmployeeRepository>(
    EmployeeRepository(
      EmployeeClient(),
      employeesBox,
    ),
  );
}
