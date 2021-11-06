import 'package:casestudy/presentation/router/app_router.dart';
import 'package:flutter/foundation.dart';

abstract class BaseBloc {
  @protected
  final AppRouter appRouter;

  BaseBloc(this.appRouter);

  @mustCallSuper
  void dispose() {
  }
}
