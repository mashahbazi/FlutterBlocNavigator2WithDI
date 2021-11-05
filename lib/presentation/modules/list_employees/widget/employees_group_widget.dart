import 'package:casestudy/common/models/employee_group_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/employee_row_widget.dart';
import 'package:casestudy/presentation/utils/extensions/context_extensions.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter/cupertino.dart';

class EmployeesGroupWidget extends StatelessWidget {
  final EmployeeGroupModel employeeGroupModel;
  final void Function(EmployeeModel) onPressItem;
  final void Function(String) onGetVisible;

  const EmployeesGroupWidget({
    required this.employeeGroupModel,
    required this.onPressItem,
    required this.onGetVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(employeeGroupModel.nameFirstLetter),
      onVisibilityChanged: (VisibilityInfo info){
        if(info.visibleFraction > 0){
          onGetVisible(employeeGroupModel.nameFirstLetter);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getWidthFraction(0.04)),
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
