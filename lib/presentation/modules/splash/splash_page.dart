import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:casestudy/presentation/modules/splash/splash_configuration.dart';
import 'package:flutter/widgets.dart';

import 'splash_bloc.dart';
import 'splash_screen.dart';

class SplashPage
    extends BasePage<SplashScreen, SplashBloc, SplashConfiguration> {
  const SplashPage(SplashConfiguration splashConfiguration)
      : super(
          key: const ValueKey("Splash"),
          name: "Splash",
          screenConfiguration: splashConfiguration,
        );

  @override
  SplashBloc getBloc() => DI.instance.getSplashBloc();

  @override
  SplashScreen getScreen() => const SplashScreen();
}
