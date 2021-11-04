import 'package:casestudy/database/tables/employees_table.dart';
import 'package:sqflite/sqflite.dart';

class TempoDB {
  static const String _databaseName = "Tempo.db";
  static const int _version = 1;

  Database? _database;

  Future<Database> get database async {
    _database ??= await _createDatabase();
    return _database!;
  }

  Future<Database> _createDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      "$path/$_databaseName",
      version: _version,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
  }

  Future<void> initDB(Database database, int version) async {
    await EmployeesTable.createTable(database, version);
  }

  Future<void> onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      await initDB(database, newVersion);
    }
  }
}
