import 'package:casestudy/presentation/modules/core/base_page.dart';
import 'package:casestudy/presentation/modules/core/screen_configuration.dart';
import 'package:flutter/cupertino.dart';

class AppRouteDelegate extends RouterDelegate<ScreenConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ScreenConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  ScreenConfiguration? _buildConfiguration;

  set buildConfiguration(ScreenConfiguration value) {
    _buildConfiguration = value;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    List<BasePage> pages = getPages();
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  List<BasePage> getPages() {
    return [];
  }

  @override
  Future<void> setNewRoutePath(ScreenConfiguration configuration) async {
    _buildConfiguration = configuration;
  }

  @override
  ScreenConfiguration? get currentConfiguration => _buildConfiguration;
}
