import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/core/screen_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inherited_screen.dart';

abstract class BasePage<T extends BaseScreen, K extends BaseBloc,
    S extends ScreenConfiguration> extends Page {
  final S screenConfiguration;
  const BasePage({
    required LocalKey key,
    required String name,
    required this.screenConfiguration,
    Object? arguments,
    String? restorationId,
  }) : super(
          key: key,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
        );

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => InheritedScreen<T, K>(getScreen(), getBloc()),
    );
  }

  T getScreen();

  K getBloc();
}
