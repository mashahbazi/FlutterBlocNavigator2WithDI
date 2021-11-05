import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:casestudy/presentation/widget/stream_builder_with_loading.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class InformationRowWidget extends StatelessWidget {
  final Stream<String> stream;
  final String title;

  const InformationRowWidget({
    required this.title,
    required this.stream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.gray,
      dashPattern: const [10, 10],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildTitle(),
            ),
            Expanded(
              flex: 3,
              child: _buildValue(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: _Style.titleTextStyle,
      ),
    );
  }

  Widget _buildValue() {
    return Align(
      alignment: Alignment.centerRight,
      child: StreamBuilderWithLoading(
        stream: stream,
        builder: (String value) => FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: _Style.valueTextStyle,
          ),
        ),
      ),
    );
  }
}

class _Style {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle valueTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.gray,
    fontWeight: FontWeight.bold,
  );
}
