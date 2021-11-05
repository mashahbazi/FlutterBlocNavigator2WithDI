import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/domain/repo/employee_repo_interface.dart';
import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/router/app_router.dart';
import 'package:rxdart/subjects.dart';

class EmployeeBloc extends BaseBloc {
  final BehaviorSubject<EmployeeModel> _employeesController;

  EmployeeBloc._(AppRouter appRouter, this._employeesController)
      : super(appRouter);

  factory EmployeeBloc.fromModel(
          AppRouter appRouter, EmployeeModel employeeModel) =>
      EmployeeBloc._(appRouter, BehaviorSubject.seeded(employeeModel));

  factory EmployeeBloc.fromId(
      AppRouter appRouter, IEmployeeRepo employeeRepo, int id) {
    EmployeeBloc employeeBloc = EmployeeBloc._(appRouter, BehaviorSubject());
    employeeBloc.loadEmployee(employeeRepo, id);
    return employeeBloc;
  }

  Stream<EmployeeModel> get employeeSteam => _employeesController.stream;

  Future<void> loadEmployee(IEmployeeRepo employeeRepo, int id) async {
    EmployeeModel employeeModel = await employeeRepo.get(id);
    _employeesController.add(employeeModel);
  }

  @override
  void dispose() {
    super.dispose();
    _employeesController.close();
  }
}
