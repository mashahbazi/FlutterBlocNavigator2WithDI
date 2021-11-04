import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_bloc.dart';
import 'inherited_screen.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<K extends BaseScreen, T extends BaseBloc>
    extends State<K> {
  late final T bloc =
      context.dependOnInheritedWidgetOfExactType<InheritedScreen<K, T>>()!.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Color get backgroundColor => AppColors.lightGray;

  PreferredSizeWidget? buildAppBar() {
    return AppBar();
  }

  Widget buildBody();
}
