import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/employee/employee_bloc.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_bloc.dart';
import 'package:casestudy/presentation/modules/splash/splash_bloc.dart';
import 'package:casestudy/presentation/router/app_router_delegate.dart';

abstract class IDependencyInjector {
  AppRouterDelegate getRouteDelegate();

  SplashBloc getSplashBloc();

  ListEmployeesBloc getListEmployeesBloc();

  EmployeeBloc getEmployeeBlocFromModel(EmployeeModel employeeModel);

  EmployeeBloc getEmployeeBlocFromId(String employeeId);
}
