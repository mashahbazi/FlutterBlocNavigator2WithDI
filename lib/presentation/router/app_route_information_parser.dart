import 'package:casestudy/presentation/modules/core/screen_configuration.dart';
import 'package:casestudy/presentation/modules/employee/employee_configuration.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_configuration.dart';
import 'package:casestudy/presentation/modules/splash/splash_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser
    extends RouteInformationParser<ScreenConfiguration> {
  @override
  Future<ScreenConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location != null) {
      Uri uri = Uri.parse(routeInformation.location!);
      List<String> pathSegments = uri.pathSegments;
      switch (pathSegments.length) {
        case 1:
          return _parseSegmentsWithLengthOne(pathSegments);
        case 2:
          return _parseSegmentsWithLengthTwo(pathSegments);
      }
    }
    return SynchronousFuture(SplashConfiguration());
  }

  Future<ScreenConfiguration> _parseSegmentsWithLengthOne(
      List<String> pathSegments) async {
    if (pathSegments.first == ListEmployeesConfiguration.name) {
      return SynchronousFuture(ListEmployeesConfiguration());
    }
    return SynchronousFuture(SplashConfiguration());
  }

  Future<ScreenConfiguration> _parseSegmentsWithLengthTwo(
      List<String> pathSegments) async {
    if (pathSegments.first == "employee") {
      int? id = int.tryParse(pathSegments.last);
      if(id !=null) {
        return SynchronousFuture(EmployeeConfiguration(id, null));
      }
    }
    return SynchronousFuture(SplashConfiguration());
  }

  @override
  RouteInformation? restoreRouteInformation(ScreenConfiguration configuration) {
    return RouteInformation(
        location: configuration.location, state: configuration.state);
  }
}
