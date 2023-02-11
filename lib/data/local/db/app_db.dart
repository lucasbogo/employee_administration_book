import 'package:drift/drift.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // open the database file
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.db'));
    return VmDatabase(file);
  });
}

class AppDb {}
