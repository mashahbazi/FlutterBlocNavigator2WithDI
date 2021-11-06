import 'package:casestudy/common/models/employee_model.dart';

abstract class IEmployeeDao {
  Future<void> insertAllData(List<EmployeeModel> employees);

  Future<List<EmployeeModel>> getNextEmployees(String? employeeName,
      [int limit]);

  Future<List<EmployeeModel>> getAllEmployeesBefore(String employeeName);

  Future<EmployeeModel> get(int id);

  Future<int> length();
}
