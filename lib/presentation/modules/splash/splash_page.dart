import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:casestudy/presentation/modules/core/inherited_screen.dart';
import 'package:casestudy/presentation/modules/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

class SplashPage extends BasePage {
  const SplashPage() : super(key: const ValueKey("Splash"), name: "Splash");

  @override
  InheritedScreen<BaseBloc> buildRoute(BuildContext context) {
    return InheritedScreen(const SplashScreen(), DI.instance.getSplashBloc());
  }
}
