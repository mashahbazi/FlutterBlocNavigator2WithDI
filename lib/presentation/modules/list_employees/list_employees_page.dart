import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:flutter/cupertino.dart';

import 'list_employees_bloc.dart';
import 'list_employees_screen.dart';

class ListEmployeesPage
    extends BasePage<ListEmployeesScreen, ListEmployeesBloc> {
  const ListEmployeesPage()
      : super(key: const ValueKey("ListEmployees"), name: "ListEmployees");

  @override
  ListEmployeesBloc getBloc() => DI.instance.getListEmployeesBloc();

  @override
  ListEmployeesScreen getScreen() => const ListEmployeesScreen();
}
