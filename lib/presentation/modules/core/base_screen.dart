import 'package:flutter/widgets.dart';

import 'base_bloc.dart';
import 'inherited_screen.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<K extends BaseScreen, T extends BaseBloc>
    extends State<K> {
  late final bloc =
  context.dependOnInheritedWidgetOfExactType<InheritedScreen>()!.bloc as T;
}
