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
  EmployeeData? _employeeData;
  EmployeeData? get employeeData => _employeeData;
  String _error = '';
  String get error => _error;
  //int _added = 0;
  //int get added => _added;
  bool _isAdded = false;
  bool get isAdded => _isAdded;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isActive = false;
  bool get isActive => _isActive;

  void getEmployeeFuture() {
    _appDb?.getEmployees().then((value) {
      _employeeListFuture = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
    //notifyListeners();
  }

  void getEmployeeStream() {
    _appDb?.getEmployeeStream().listen((event) {
      _employeeListFuture = event;
      notifyListeners();
    });
  }

  void getEmployee(int id) {
    _appDb?.getEmployee(id).then((value) {
      _employeeData = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    void insertEmployee(EmployeeCompanion entity) {
      _appDb?.insertEmployee(entity).then((value) {
        _isAdded = value >= 1 ? true : false;
      }).onError((error, stackTrace) {
        _error = error.toString();
      });
      notifyListeners();
    }

    void updateEmployee(EmployeeCompanion entity) {
      _appDb?.updateEmployee(entity).then((value) {
        _isUpdated = true;
      }).onError((error, stackTrace) {
        _error = error.toString();
      });
      notifyListeners();
    }

    void deleteEmployee(int id) {
      _appDb?.deleteEmployee(id).then((value) {
        if (value == 0) {
          _error = 'Não foi possível deletar o empregado  $id';
        } else {
          _isDeleted = true;
        }
        notifyListeners();
      }).onError((error, stackTrace) {
        _error = error.toString();
        notifyListeners();
      });
    }

    void setIsActive(bool value) {
      _isActive = value;
      notifyListeners();
    }

    void setIsUpdated(bool value) {
      _isUpdated = value;
      notifyListeners();
    }

    void setIsDeleted(bool value) {
      _isDeleted = value;
      notifyListeners();
    }

    void setErrorMsg(String value) {
      _error = value;
      notifyListeners();
    }
  }

  initAppDb(AppDb db) {}
}
