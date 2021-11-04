import 'package:flutter/widgets.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double getWidthFraction(double fraction) => screenWidth * fraction;

  double getHeightFraction(double fraction) => screenHeight * fraction;
}
