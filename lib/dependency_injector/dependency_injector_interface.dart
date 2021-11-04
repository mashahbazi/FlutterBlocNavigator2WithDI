import 'package:casestudy/presentation/modules/splash/splash_bloc.dart';
import 'package:casestudy/presentation/router/app_router_delegate.dart';

abstract class IDependencyInjector {
  AppRouteDelegate getRouteDelegate();

  SplashBloc getSplashBloc();
}
