import 'package:employee_application/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  EmployeeCard({this.employee}) : assert(employee != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: SizedBox(
        height: 80.0,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    employee.id.toString(),
                  ),
                ),
              ),
              VerticalDivider(
                color: Color.fromRGBO(190, 190, 190, 1),
                thickness: 2.0,
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Center(
                    child: Text(employee.firstName + " " + employee.lastName),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
