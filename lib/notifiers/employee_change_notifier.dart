import 'package:employee_book/data/local/db/app_db.dart';
import 'package:flutter/foundation.dart';
import 'package:employee_book/data/local/entity/employee_entity.dart';

class EmployeeChangeNotifier extends ChangeNotifier {
  AppDb? _appDb;

  void init(AppDb db) {
    _appDb = db;
  }

  List<EmployeeData> _employeeListFuture = [];
  List<EmployeeData> get employeeListFuture => _employeeListFuture;
  List<EmployeeData> _employeeListStream = [];
  List<EmployeeData> get employeeListStream => _employeeListStream;
  String _error = '';
  String get error => _error;

  void getEmployeeFuture() {
    _appDb?.getEmployees().then((value) {
      _employeeListFuture = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEmployeeStream() {
    _appDb?.getEmployeeStream().listen((event) {
      _employeeListFuture = event;
      notifyListeners();
    });
  }

  void insertEmployee(EmployeeCompanion entity) {
    _appDb?.insertEmployee(entity).then((value) {
      getEmployeeStream();
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }

  void updateEmployee(EmployeeCompanion entity) {
    _appDb?.updateEmployee(entity).then((value) {
      getEmployeeStream();
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }

  void deleteEmployee(int id) {
    _appDb?.deleteEmployee(id).then((value) {
      getEmployeeStream();
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }
}
