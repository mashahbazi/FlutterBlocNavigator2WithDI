import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class DashSeparatorPainter extends CustomPainter {
  const DashSeparatorPainter();

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = AppColors.gray
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height),
          Offset(startX + dashWidth, size.height), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
