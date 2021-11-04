import 'package:casestudy/common/models/employee_model.dart';
import 'package:sqflite/sqflite.dart';

class EmployeesTable {
  static const tableName = "Employees";

  static Future<void> createTable(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $tableName (
      ${EmployeeProps.id} INTEGER PRIMARY KEY NOT NULL, 
      ${EmployeeProps.imageUrl} TEXT NOT NULL, 
      ${EmployeeProps.firstName} TEXT NOT NULL,
      ${EmployeeProps.lastName} TEXT NOT NULL,
      ${EmployeeProps.email} TEXT NOT NULL,
      ${EmployeeProps.contactNumber} TEXT NOT NULL,
      ${EmployeeProps.age} INTEGER NOT NULL,
      ${EmployeeProps.dob} TEXT NOT NULL,
      ${EmployeeProps.salary} REAL NOT NULL,
      ${EmployeeProps.address} TEXT NOT NULL
    )
    ''');
  }
}
