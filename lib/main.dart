import 'package:employee_book/data/local/db/app_db.dart';
import 'package:employee_book/routes/route_generator.dart';
import 'package:employee_book/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/employee_change_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider.value(value: AppDb()),
      ChangeNotifierProxyProvider<AppDb, EmployeeChangeNotifier>(
        create: (context) => EmployeeChangeNotifier(),
        update: (context, db, notifier) => notifier!
          ..init(db)
          ..getEmployeeFuture(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle de Funcionários',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
