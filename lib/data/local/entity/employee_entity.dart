import 'package:drift/drift.dart';

class Employee extends Table {
  // IntColumn is a type of column that holds integers
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get email => text().named('email')();
  TextColumn get phone => text().named('phone')();
  DateTimeColumn get dateOfBirth => dateTime().named('dateOfBirth')();
  IntColumn get isActive => integer().named('is_active').nullable()();
}
