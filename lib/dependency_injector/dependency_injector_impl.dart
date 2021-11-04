import 'package:casestudy/data/api/employee_source_interface.dart';
import 'package:casestudy/data/dao/employee_dao_interface.dart';
import 'package:casestudy/data/repo/employee_repo_impl.dart';
import 'package:casestudy/database/dao/employee_dao_impl.dart';
import 'package:casestudy/database/tempo_db.dart';
import 'package:casestudy/dependency_injector/dependency_injector_interface.dart';
import 'package:casestudy/domain/repo/employee_repo_interface.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_bloc.dart';
import 'package:casestudy/presentation/modules/splash/splash_bloc.dart';
import 'package:casestudy/presentation/router/app_router.dart';
import 'package:casestudy/presentation/router/app_router_delegate.dart';
import 'package:casestudy/source/employee_source_impl.dart';

class DI implements IDependencyInjector {
  static final IDependencyInjector instance = DI._();

  final Map<Type, Object> _singletons = {};

  DI._();

  @override
  AppRouteDelegate getRouteDelegate() =>
      _getSingleton<AppRouteDelegate>(() => AppRouteDelegate());

  ///////////////////////////////////////////////
  //////              Bloc           ////////////
  ///////////////////////////////////////////////
  @override
  SplashBloc getSplashBloc() => SplashBloc(_getAppRouter(), _getEmployeeRepo());

  @override
  ListEmployeesBloc getListEmployeesBloc() => ListEmployeesBloc(_getAppRouter(),_getEmployeeRepo());

  ///////////////////////////////////////////////
  //////              DAO            ////////////
  ///////////////////////////////////////////////
  IEmployeeDao _getEmployeeDao() => EmployeeDaoImpl(_getTempoDB());

  ///////////////////////////////////////////////
  //////              Source         ////////////
  ///////////////////////////////////////////////
  IEmployeeSource _getEmployeeSource() => EmployeeSourceImpl();

  ///////////////////////////////////////////////
  //////              Repos          ////////////
  ///////////////////////////////////////////////
  IEmployeeRepo _getEmployeeRepo() =>
      EmployeeRepoImpl(_getEmployeeSource(), _getEmployeeDao());

  AppRouter _getAppRouter() =>
      _getSingleton<AppRouter>(() => AppRouter(getRouteDelegate()));

  TempoDB _getTempoDB() => _getSingleton<TempoDB>(() => TempoDB());

  T _getSingleton<T extends Object>(T Function() creator) {
    T? instance = _singletons[T] as T?;
    if (instance == null) {
      instance = creator.call();
      _singletons[instance.runtimeType] = instance;
    }
    return instance;
  }
}
