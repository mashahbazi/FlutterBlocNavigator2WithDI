import 'package:casestudy/common/models/employee_model.dart';

abstract class IEmployeeSource {
  Future<List<EmployeeModel>> loadData();
}
