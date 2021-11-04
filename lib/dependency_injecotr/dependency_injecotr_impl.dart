import 'package:casestudy/dependency_injecotr/dependency_injector_interface.dart';
import 'package:casestudy/presentation/router/app_router.dart';
import 'package:casestudy/presentation/router/app_router_delegate.dart';

class DI implements IDependencyInjector {
  static final IDependencyInjector instance = DI._();

  final Map<Type, Object> _singletons = {};

  DI._();

  @override
  AppRouteDelegate getRouteDelegate() =>
      _getSingleton<AppRouteDelegate>(() => AppRouteDelegate());

  AppRouter getAppRouter() =>
      _getSingleton<AppRouter>(() => AppRouter(getRouteDelegate()));

  T _getSingleton<T extends Object>(T Function() creator) {
    T? instance = _singletons[T] as T?;
    if (instance == null) {
      instance = creator.call();
      _singletons[instance.runtimeType] = instance;
    }
    return instance;
  }
}