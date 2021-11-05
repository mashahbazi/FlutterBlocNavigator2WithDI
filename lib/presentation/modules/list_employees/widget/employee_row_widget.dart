import 'dart:ui';

import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/list_employees/widget/dash_separator_painter.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:casestudy/presentation/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeRowWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
  final void Function(EmployeeModel) onPressItem;

  EmployeeRowWidget({
    required this.employeeModel,
    required this.onPressItem,
  }) : super(key: ValueKey(employeeModel.id));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressItem(employeeModel);
      },
      child: SizedBox.fromSize(
        size: Size.fromHeight(context.getHeightFraction(0.14)),
        child: Row(
          children: [
            _buildImage(context),
            Expanded(
              child: _buildInfo(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.getWidthFraction(0.03)),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.screenWidth),
          child: Image.network(employeeModel.imageUrl),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return CustomPaint(
      painter: const DashSeparatorPainter(),
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: context.getHeightFraction(0.01)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildName(),
            _buildEmail(),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      employeeModel.fullName,
      style: _Style.nameTextStyle,
    );
  }

  Widget _buildEmail() {
    return Text(
      employeeModel.email,
      maxLines: 1,
      style: _Style.emailTextStyle,
    );
  }
}

class _Style {
  static const TextStyle nameTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );
  static const TextStyle emailTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.gray,
  );
}
