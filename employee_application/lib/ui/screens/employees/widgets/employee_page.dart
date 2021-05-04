import 'package:employee_application/consts/box_consts.dart';
import 'package:employee_application/locator.dart';
import 'package:employee_application/models/employee_model.dart';
import 'package:employee_application/providers/employee_model.dart';
import 'package:employee_application/repositories/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'employee_card.dart';

class EmployeePage extends StatelessWidget {
  final List<Employee> employees;

  EmployeePage({this.employees});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Selector<EmployeeModel, List<Employee>>(
        builder: (context, data, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await getIt.get<EmployeeRepository>().fetchEmployees(tEmployeesBox, context);
            },
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return EmployeeCard(
                  employee: data[index],
                );
              },
            ),
          );
        },
        selector: (buildContext, model) => employees,
      ),
    );
  }
}
