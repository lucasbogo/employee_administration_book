import 'package:employee_book/data/local/db/app_db.dart';
import 'package:employee_book/routes/route_generator.dart';
import 'package:employee_book/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) =>
          AppDb(), // Singleton to connect to database only once
      child: MyApp(),
      dispose: (context, AppDb db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
