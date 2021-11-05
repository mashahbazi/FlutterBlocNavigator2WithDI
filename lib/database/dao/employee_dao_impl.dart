import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/data/dao/employee_dao_interface.dart';
import 'package:casestudy/database/dao/core/base_dao.dart';
import 'package:casestudy/database/exception/database_exception.dart';
import 'package:casestudy/database/tables/employees_table.dart';
import 'package:casestudy/database/tempo_db.dart';
import 'package:sqflite/sqflite.dart' hide DatabaseException;

class EmployeeDaoImpl extends BaseDao implements IEmployeeDao {
  EmployeeDaoImpl(TempoDB tempoDB) : super(tempoDB);

  @override
  Future<void> insertAllData(List<EmployeeModel> employees) async {
    try {
      Database database = await tempoDB.database;
      Batch batch = database.batch();
      for (EmployeeModel employeeModel in employees) {
        batch.insert(
          EmployeesTable.tableName,
          employeeModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      await batch.commit();
    } catch (e) {
      throw DatabaseException(
          DatabaseExceptionCodes.insertEmployees, e.toString());
    }
  }

  @override
  Future<List<EmployeeModel>> getNextEmployees(String? employeeName,
      [int limit = 50]) async {
    try {
      Database database = await tempoDB.database;
      List<Map<String, Object?>> result = await database.query(
        EmployeesTable.tableName,
        limit: limit,
        where: employeeName != null
            ? "${EmployeeProps.firstName} > '$employeeName'"
            : null,
        orderBy: EmployeeProps.firstName,
      );
      return result
          .map((Map<String, dynamic> item) => EmployeeModel.fromJson(item))
          .toList();
    } catch (e) {
      throw DatabaseException(
          DatabaseExceptionCodes.getListEmployees, e.toString());
    }
  }

  @override
  Future<List<EmployeeModel>> getAllEmployeesBefore(String employeeName) async {
    try {
      Database database = await tempoDB.database;
      List<Map<String, Object?>> result = await database.query(
        EmployeesTable.tableName,
        where: "${EmployeeProps.firstName} <= '$employeeName'",
        orderBy: EmployeeProps.firstName,
      );
      return result
          .map((Map<String, dynamic> item) => EmployeeModel.fromJson(item))
          .toList();
    } catch (e) {
      throw DatabaseException(
          DatabaseExceptionCodes.getListEmployees, e.toString());
    }
  }

  @override
  Future<EmployeeModel> get(int id) async {
    try {
      Database database = await tempoDB.database;
      List<Map<String, Object?>> result = await database.query(
        EmployeesTable.tableName,
        where: "${EmployeeProps.id} = $id",
      );
      return result
          .map((Map<String, dynamic> item) => EmployeeModel.fromJson(item))
          .first;
    } catch (e) {
      throw DatabaseException(
          DatabaseExceptionCodes.getListEmployees, e.toString());
    }
  }
}
