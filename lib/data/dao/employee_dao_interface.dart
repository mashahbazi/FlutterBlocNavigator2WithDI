import 'package:casestudy/common/models/employee_model.dart';

abstract class IEmployeeDao {
  Future<void> insertAllData(List<EmployeeModel> employees);

  Future<List<EmployeeModel>> getList({int limit, int offset});

  Future<List<EmployeeModel>> getNextEmployees(String? employeeName,
      [int limit]);

  Future<List<EmployeeModel>> getAllEmployeesBefore(String employeeName);
}
