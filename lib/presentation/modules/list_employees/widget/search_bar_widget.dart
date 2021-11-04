import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:casestudy/presentation/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.getWidthFraction(0.05),
        vertical: context.getHeightFraction(0.02),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.getWidthFraction(0.05),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor, width: 2),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTextField(),
          ),
          _buildSearchIcon(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return const TextField(
      style: _Style.textStyle,
      decoration: InputDecoration(
        hintText: "Search employee",
        hintStyle: _Style.hintTextStyle,
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildSearchIcon() {
    return const Icon(
      Icons.search,
      color: AppColors.darkGray,
    );
  }
}

class _Style {
  static const TextStyle textStyle =
      TextStyle(fontSize: 14, color: AppColors.black);
  static const TextStyle hintTextStyle =
      TextStyle(fontSize: 14, color: AppColors.darkGray);
}
