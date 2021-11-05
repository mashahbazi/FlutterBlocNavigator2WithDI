import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/core/screen_configuration.dart';

class EmployeeConfiguration extends ScreenConfiguration{
  final int employeeId;
  final EmployeeModel? employeeModel;

  EmployeeConfiguration(this.employeeId, this.employeeModel);

  @override
  String get location => "employee/$employeeId";

  @override
  Object? get state => null;

}