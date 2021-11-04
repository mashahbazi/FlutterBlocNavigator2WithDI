import 'package:casestudy/presentation/modules/core/screen_configuration.dart';
import 'package:casestudy/presentation/modules/splash/splash_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser
    extends RouteInformationParser<ScreenConfiguration> {
  @override
  Future<ScreenConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    return SynchronousFuture(SplashConfiguration());
  }

  @override
  RouteInformation? restoreRouteInformation(ScreenConfiguration configuration) {
    return RouteInformation(
        location: configuration.location, state: configuration.state);
  }
}
