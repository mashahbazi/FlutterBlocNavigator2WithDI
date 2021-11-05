import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:casestudy/presentation/modules/employee/employee_configuration.dart';
import 'package:flutter/cupertino.dart';

import 'employee_bloc.dart';
import 'employee_screen.dart';

class EmployeePage
    extends BasePage<EmployeeScreen, EmployeeBloc, EmployeeConfiguration> {
  EmployeePage(EmployeeConfiguration employeeConfiguration)
      : super(
          key: ValueKey("Employee${employeeConfiguration.employeeId}"),
          name: "Employee",
          screenConfiguration: employeeConfiguration,
        );

  @override
  EmployeeBloc getBloc() {
    if (screenConfiguration.employeeModel != null) {
      return DI.instance.getEmployeeBlocFromModel(screenConfiguration.employeeModel!);
    }
    return DI.instance.getEmployeeBlocFromId(screenConfiguration.employeeId);
  }

  @override
  EmployeeScreen getScreen() => const EmployeeScreen();
}
