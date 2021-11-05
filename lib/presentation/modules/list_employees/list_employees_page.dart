import 'package:casestudy/dependency_injector/dependency_injector_impl.dart';
import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_configuration.dart';
import 'package:flutter/cupertino.dart';

import 'list_employees_bloc.dart';
import 'list_employees_screen.dart';

class ListEmployeesPage extends BasePage<ListEmployeesScreen, ListEmployeesBloc,
    ListEmployeesConfiguration> {
  const ListEmployeesPage(ListEmployeesConfiguration listEmployeesConfiguration)
      : super(
          key: const ValueKey("ListEmployees"),
          name: "ListEmployees",
          screenConfiguration: listEmployeesConfiguration,
        );

  @override
  ListEmployeesBloc getBloc() => DI.instance.getListEmployeesBloc();

  @override
  ListEmployeesScreen getScreen() => const ListEmployeesScreen();
}
