import 'package:employee_book/screens/add_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:employee_book/screens/home_screen.dart';
import 'package:employee_book/screens/add_employee_screen.dart';
import 'package:employee_book/screens/edit_employee_screen.dart';

class RouteGenerator {
  final args = settings.arguments;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => AddEmployeeScreen());
      case '/edit_employee':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => EditEmployeeScreen(id: args));
        }
        return _errorRoute();
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
