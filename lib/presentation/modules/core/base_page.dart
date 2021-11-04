import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inherited_screen.dart';

abstract class BasePage extends Page {
  const BasePage({
    required LocalKey key,
    required String name,
    Object? arguments,
    String? restorationId,
  }) : super(
      key: key,
      name: name,
      arguments: arguments,
      restorationId: restorationId);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: buildRoute,
    );
  }

  InheritedScreen buildRoute(BuildContext context);
}
