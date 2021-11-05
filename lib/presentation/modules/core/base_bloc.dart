import 'dart:async';

import 'package:casestudy/presentation/router/app_router.dart';
import 'package:flutter/foundation.dart';

abstract class BaseBloc {
  @protected
  final AppRouter appRouter;
  final StreamController<bool> _loadingController =
      StreamController.broadcast();

  BaseBloc(this.appRouter);

  Stream<bool> get loadingStream => _loadingController.stream;

  void showLoading() {
    _loadingController.add(true);
  }

  void hideLoading() {
    _loadingController.add(false);
  }

  @mustCallSuper
  void dispose() {
    _loadingController.close();
  }
}
