import 'package:employee_application/consts/box_consts.dart';
import 'package:employee_application/locator.dart';
import 'package:employee_application/models/employee_model.dart';
import 'package:employee_application/providers/employee_model.dart';
import 'package:employee_application/repositories/employee_repository.dart';
import 'package:employee_application/ui/screens/employees/widgets/employee_page.dart';
import 'package:employee_application/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: EmployeeCategory.values.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(140, 140, 140, 1),
          bottom: TabBar(
            tabs: [
              for (int i = 0; i < EmployeeCategory.values.length; i++) ...{
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    EmployeeCategory.values[i].toString().formatString('.'),
                  ),
                ),
              }
            ],
          ),
          title: Text('Employees Application'),
          centerTitle: true,
        ),
        body: FutureBuilder<Employees>(
          future: getIt.get<EmployeeRepository>().fetchEmployees(tEmployeesBox, context),
          builder: (context, data) {
            if (data != null && data.hasData) {
              return TabBarView(
                children: [
                  EmployeePage(employees: context.read<EmployeeModel>().itEmployees),
                  EmployeePage(employees: context.read<EmployeeModel>().hrEmployees),
                ],
              );
            } else {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}

extension TabString on String {
  String formatString(String pattern) {
    return this.split(pattern)[1].toUpperCase();
  }
}
