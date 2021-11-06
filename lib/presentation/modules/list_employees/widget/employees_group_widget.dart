import 'package:casestudy/common/models/employee_group_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/employee_row_widget.dart';
import 'package:casestudy/presentation/utils/extensions/context_extensions.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EmployeesGroupWidget extends StatelessWidget {
  final EmployeeGroupModel employeeGroupModel;
  final void Function(EmployeeModel) onPressItem;
  final void Function(String char) onGetVisible;

  EmployeesGroupWidget({
    required this.employeeGroupModel,
    required this.onPressItem,
    required this.onGetVisible,
    Key? key,
  }) : super(
            key: ValueKey(
                "EmployeesGroupWidget${employeeGroupModel.nameFirstLetter}"));

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("EmployeesGroupWidget${employeeGroupModel.nameFirstLetter}"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.size.height * info.visibleFraction > 100) {
          onGetVisible(employeeGroupModel.nameFirstLetter);
        }
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getWidthFraction(0.04)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGroupTitle(),
            _buildListEmployees(),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupTitle() {
    return Text(
      employeeGroupModel.nameFirstLetter.toUpperCase(),
      style: _Style.titleTextStyle,
    );
  }

  Widget _buildListEmployees() {
    return Column(
      children: employeeGroupModel.employees
          .map((EmployeeModel employeeModel) => EmployeeRowWidget(
                employeeModel: employeeModel,
                onPressItem: onPressItem,
              ))
          .toList(),
    );
  }
}

class _Style {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.black,
  );
}
