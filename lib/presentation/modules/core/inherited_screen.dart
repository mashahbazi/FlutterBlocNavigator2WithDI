import 'package:flutter/widgets.dart';

import 'base_bloc.dart';
import 'base_screen.dart';

///
/// Use to inject [bloc] into screen states.
///
/// All screens should wrap into an [InheritedScreen] so screen state can get
/// bloc from it.
///
class InheritedScreen<T extends BaseBloc> extends InheritedWidget {
  final T bloc;

  const InheritedScreen(BaseScreen screen, this.bloc, {Key? key})
      : super(child: screen, key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is! InheritedScreen || bloc.hashCode != oldWidget.bloc.hashCode;
}
