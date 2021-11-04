import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:flutter/widgets.dart';

import 'splash_bloc.dart';
import 'splash_screen.dart';

class SplashPage extends BasePage<SplashScreen, SplashBloc> {
  const SplashPage() : super(key: const ValueKey("Splash"), name: "Splash");

  @override
  SplashBloc getBloc() => DI.instance.getSplashBloc();

  @override
  SplashScreen getScreen() => const SplashScreen();
}
