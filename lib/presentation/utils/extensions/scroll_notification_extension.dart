import 'package:flutter/cupertino.dart';

extension ScrollNotificationExtension on ScrollNotification {
  bool isBottom([double offset = 0]) =>
      metrics.pixels > metrics.maxScrollExtent - offset;
}
