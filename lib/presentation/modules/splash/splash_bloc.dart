import 'package:casestudy/domain/repo/employee_repo_interface.dart';
import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/router/app_router.dart';

class SplashBloc extends BaseBloc {
  static const Duration navigationDelay = Duration(seconds: 3);

  final IEmployeeRepo _employeeRepo;

  DateTime? _initiateStart;

  SplashBloc(AppRouter appRouter, this._employeeRepo) : super(appRouter);

  Future<void> initiateApp() async {
    _initiateStart = DateTime.now();

    await _employeeRepo.loadData();

    int delayMS = navigationDelay.inMilliseconds -
        DateTime.now().difference(_initiateStart!).inMilliseconds;
    await Future.delayed(Duration(milliseconds: delayMS));
  }

  void navigateToListEmployees() {
    // TODO : Add navigation
  }
}
