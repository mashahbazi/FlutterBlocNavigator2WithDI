import 'package:casestudy/common/models/employee_model.dart';

abstract class IEmployeeDao {
  Future<void> insertAllData(List<EmployeeModel> employees);

  Future<List<EmployeeModel>> getList({int limit, int offset});
}
