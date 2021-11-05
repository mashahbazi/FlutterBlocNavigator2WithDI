import 'package:casestudy/common/models/employee_group_model.dart';
import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/list_employees/list_employees_bloc.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/character_picker_widget.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/employees_group_widget.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:casestudy/presentation/utils/extensions/scroll_notification_extension.dart';
import 'package:casestudy/presentation/widget/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widget/search_bar_widget.dart';

class ListEmployeesScreen extends BaseScreen {
  const ListEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListEmployeesState();
}

class _ListEmployeesState
    extends BaseScreenState<ListEmployeesScreen, ListEmployeesBloc> {
  final Map<String, GlobalKey> groupKeys = {};
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(onScrollChange);
  }

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
          child: Row(
            children: [
              Expanded(child: _buildListEmployeesStream()),
              _buildCharacterRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListEmployeesStream() {
    return StreamBuilder(
      stream: bloc.employeeGroupStream,
      builder: (_, AsyncSnapshot<List<EmployeeGroupModel>?> snapshot) {
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
    return NotificationListener<ScrollNotification>(
      onNotification: onScrollNotification,
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: employeeGroups.length + 1,
        itemBuilder: (_, int index) {
          if (index < employeeGroups.length) {
            EmployeeGroupModel groupModel = employeeGroups[index];
            GlobalKey? globalKey = groupKeys[groupModel.nameFirstLetter];
            if (globalKey == null) {
              globalKey = GlobalKey();
              groupKeys[groupModel.nameFirstLetter] = globalKey;
            }
            return EmployeesGroupWidget(
              employeeGroupModel: groupModel,
              onPressItem: bloc.onTapEmployee,
              key: globalKey,
            );
          }
          if (bloc.hasMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: AppLoadingWidget(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildCharacterRow() {
    return CharacterPickerWidget(
      charStream: bloc.charStream,
      onSelectChar: onSelectChar,
    );
  }

  bool onScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification.isBottom(500) && bloc.hasMore) {
      bloc.loadData();
    }
    return true;
  }

  void onScrollChange() {
    bloc.charGroupGetVisible(String.fromCharCode(
        itemPositionsListener.itemPositions.value.last.index + 65));
  }

  Future<void> onSelectChar(String char) async {
    bloc.showLoading();
    await bloc.onSelectChar(char);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      itemScrollController.scrollTo(
          index: char.codeUnitAt(0) - 65, duration: const Duration(seconds: 1));
      bloc.hideLoading();
    });
  }
}

class _Style {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.black,
  );
}
