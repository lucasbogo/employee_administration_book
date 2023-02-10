import 'package:employee_book/screens/add_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:employee_book/screens/home_screen.dart';
import 'package:employee_book/screens/add_employee_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => AddEmployeeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sem rota definida'),
        ),
        body: const Center(
          child: Text('Desculpe, mas não há rota definida para esta tela.'),
        ),
      );
    });
  }
}
