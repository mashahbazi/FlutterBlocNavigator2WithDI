import 'package:casestudy/common/models/employee_group_model.dart';
import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_bloc.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/employees_group_widget.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:casestudy/presentation/widget/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widget/search_bar_widget.dart';

class ListEmployeesScreen extends BaseScreen {
  const ListEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListEmployeesState();
}

class _ListEmployeesState
    extends BaseScreenState<ListEmployeesScreen, ListEmployeesBloc> {
  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      title: const Text(
        "Employees Directory",
        style: _Style.appBarTitleTextStyle,
      ),
      leading: const Icon(
        Icons.menu,
        color: AppColors.black,
        size: 32,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.gray,
        ),
      ),
    );
  }

  @override
  Widget buildBody() {
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: _buildListEmployeesStream(),
        ),
      ],
    );
  }

  Widget _buildListEmployeesStream() {
    return StreamBuilder(
      stream: bloc.employeeGroupStream,
      builder: (_, AsyncSnapshot<List<EmployeeGroupModel>> snapshot) {
        if (snapshot.hasData) {
          return _buildListEmployees(snapshot.data!);
        } else {
          return const Center(
            child: AppLoadingWidget(),
          );
        }
      },
    );
  }

  Widget _buildListEmployees(List<EmployeeGroupModel> employeeGroups) {
    return ListView.builder(
      itemCount: employeeGroups.length + 1,
      itemBuilder: (_, int index) {
        if (index < employeeGroups.length) {
          return EmployeesGroupWidget(
            employeeGroupModel: employeeGroups[index],
            onPressItem: bloc.onTapEmployee,
          );
        }
        return const AppLoadingWidget();
      },
    );
  }
}

class _Style {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.black,
  );
}
