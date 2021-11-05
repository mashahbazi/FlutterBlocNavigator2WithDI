import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/employee_model.dart';

abstract class IEmployeeRepo {
  Future<void> loadData();

  Future<EmployeeListModel> getNextEmployees(String? employeeName);

  Future<EmployeeListModel> getAllEmployeesBefore(String employeeName);

  Future<EmployeeModel> get(int id);
}
