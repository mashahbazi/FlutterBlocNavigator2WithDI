import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/common/models/pagination_model.dart';

class EmployeeListModel {
  final List<EmployeeModel> employees;
  final PaginationModel paginationModel;

  EmployeeListModel(this.employees, this.paginationModel);
}
