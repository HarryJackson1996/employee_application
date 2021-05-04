import 'package:employee_application/clients/employee_client.dart';
import 'package:employee_application/models/employee_model.dart';
import 'package:employee_application/providers/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class EmployeeRepository {
  final EmployeeClient client;
  final Box<Employees> box;

  EmployeeRepository(
    this.client,
    this.box,
  ) : assert(client != null, box != null);

  /// Fetches employees initially from "server": (local json file)
  /// Caches data, notifies listeners and returns data.
  Future<Employees> fetchEmployees(String key, BuildContext context) async {
    final localEmployees = this.box.get(key);

    if (localEmployees == null) {
      print('remote employees');
      Employees remoteEmployees;
      await this.client.fetchEmployees().then((value) async => {
            remoteEmployees = value,
            await this.box.put(key, value),
          });
      await Future.delayed(Duration(seconds: 2));
      Provider.of<EmployeeModel>(context, listen: false).setEmployees(remoteEmployees.employees);
      return remoteEmployees;
    } else {
      print('local employees');
      await Future.delayed(Duration(seconds: 2));
      Provider.of<EmployeeModel>(context, listen: false).setEmployees(localEmployees.employees);
      return localEmployees;
    }
  }
}
