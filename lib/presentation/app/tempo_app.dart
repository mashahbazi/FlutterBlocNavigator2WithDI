import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/router/app_route_information_parser.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
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
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
      ),
    );
  }
}
