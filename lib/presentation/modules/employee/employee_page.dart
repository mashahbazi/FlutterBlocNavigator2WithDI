import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:flutter/cupertino.dart';

import 'employee_bloc.dart';
import 'employee_screen.dart';

class EmployeePage extends BasePage<EmployeeScreen, EmployeeBloc> {
  final int employeeId;
  final EmployeeModel? employeeModel;

  EmployeePage(this.employeeId, this.employeeModel)
      : super(key: ValueKey("Employee$employeeId"), name: "Employee");

  @override
  EmployeeBloc getBloc() {
    if(employeeModel != null){
      return DI.instance.getEmployeeBlocFromModel(employeeModel!);
    }
    return DI.instance.getEmployeeBlocFromId(employeeId);
  }

  @override
  EmployeeScreen getScreen() => const EmployeeScreen();
}
