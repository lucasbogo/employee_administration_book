import 'dart:io';

import 'package:employee_book/data/local/entity/employee_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // open the database file
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'employee.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Employee])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Buscar a lista de empregados
  Future<List<EmployeeData>> getEmployees() async {
    return await select(employee).get();
  }

  Stream<List<EmployeeData>> getEmployeeStream() {
    return select(employee).watch();
  }

  // Buscar um empregado pelo id
  Future<EmployeeData> getEmployee(int id) async {
    return await (select(employee)..where((t) => t.id.equals(id))).getSingle();
  }

  // Atualizar um empregado
  Future<bool> updateEmployee(EmployeeCompanion entity) async {
    return await update(employee).replace(entity);
  }

  // Inserir um empregado
  Future<int> insertEmployee(EmployeeCompanion entity) async {
    return await into(employee).insert(entity);
  }

  // Deletar um empregado
  Future<int> deleteEmployee(int id) async {
    return await (delete(employee)..where((t) => t.id.equals(id))).go();
  }
}
