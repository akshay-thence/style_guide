import 'package:flutter/material.dart';

import 'colors/colors.dart';
import 'settings/settings.dart';

class AppRouter {
  static const String settings = '/home';
  static const String colors = '/colors';

  Route onGenerateRoute(RouteSettings r) {
    // AppLogger.s(settings.name.toString(), tag: 'route_name');
    switch (r.name) {
      case settings:
        return _materialRoute(const SettingPage());

      case colors:
        return _materialRoute(const ColorPage());

      default:
        return _materialRoute(const ColoredBox(color: Colors.red));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(builder: (_) => view);
  }
}
