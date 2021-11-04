import 'package:casestudy/presentation/modules/core/screen_configuration.dart';

import 'app_router_delegate.dart';

class AppRouter {
  final AppRouteDelegate _router;

  AppRouter(this._router);

  void changeToScreen(ScreenConfiguration configuration) {
    _router.buildConfiguration = configuration;
  }
}
