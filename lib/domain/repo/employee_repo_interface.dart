import 'package:casestudy/common/models/employee_list_model.dart';

abstract class IEmployeeRepo {
  Future<void> loadData();

  Future<EmployeeListModel> getNextEmployees(String? employeeName);

  Future<EmployeeListModel> getAllEmployeesBefore(String employeeName);
}
