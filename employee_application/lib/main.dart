import 'package:employee_application/locator.dart';
import 'package:employee_application/models/employee_model.dart';
import 'package:employee_application/providers/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:employee_application/consts/box_consts.dart';
import 'package:provider/provider.dart';
import 'utils/router_utils.dart' as MyRouter;

void _registerTypeAdapters() {
  Hive.registerAdapter(EmployeeAdapter());
  Hive.registerAdapter(EmployeesAdapter());
  Hive.registerAdapter(EmployeeCategoryAdapter());
}

void _registerDeviceOrientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  _registerTypeAdapters();
  var employeesBox = await Hive.openBox<Employees>(tEmployeesBox);

  setup(employeesBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeeModel>(create: (context) => EmployeeModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.Router.generateRoute,
    );
  }
}
