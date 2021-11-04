import 'package:casestudy/dependency_injecotr/dependency_injecotr_impl.dart';
import 'package:casestudy/presentation/router/app_route_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TempoApp extends StatelessWidget {
  const TempoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate: DI.instance.getRouteDelegate(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
