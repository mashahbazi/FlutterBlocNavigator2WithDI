import 'package:casestudy/common/models/employee_model.dart';

class EmployeeGroupModel{
  final String nameFirstLetter;
  final List<EmployeeModel> employees;

  EmployeeGroupModel(this.nameFirstLetter, this.employees);
}