import 'package:flutter/material.dart';

import 'colors/colors.dart';
import 'settings/settings.dart';
import 'typeface/typeface.dart';

class AppRouter {
  static const String settings = '/home';
  static const String colors = '/colors';
  static const String createColor = '/CreateColor';
  static const String pickTypeface = '/PickTypeFace';
  static const String searchFonts = '/searchFonts';

  Route onGenerateRoute(RouteSettings r) {
    // AppLogger.s(settings.name.toString(), tag: 'route_name');
    switch (r.name) {
      case settings:
        return _materialRoute(const SettingPage());

      case colors:
        return _materialRoute(const ViewColorPage());

      case createColor:
        return _materialRoute(const CreateColorPage());

      case searchFonts:
        return _materialRoute(const SearchFontPage());

      case pickTypeface:
        return _materialRoute(const PickTypeFace());

      default:
        return _materialRoute(const ColoredBox(color: Colors.red));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(builder: (_) => view);
  }
}
