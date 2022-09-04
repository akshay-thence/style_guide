import 'package:flutter/material.dart';
import 'package:thence_style_guide/splash/view/splash_page.dart';

import 'colors/colors.dart';
import 'settings/settings.dart';
import 'typeface/typeface.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String settings = '/home';
  static const String colors = '/colors';
  static const String createColor = '/CreateColor';
  static const String pickTypeface = '/PickTypeFace';
  static const String searchFonts = '/searchFonts';
  static const String selectedFont = '/selectedFont';

  Route onGenerateRoute(RouteSettings r) {
    // AppLogger.s(settings.name.toString(), tag: 'route_name');
    switch (r.name) {
      case splash:
        return _materialRoute(const SplashPage());

      case settings:
        return _materialRoute(const SettingPage());

      case colors:
        return _materialRoute(const ViewColorPage());

      case createColor:
        return _materialRoute(const CreateColorPage());

      case searchFonts:
        return _materialRoute(const SearchFontPage());

      case pickTypeface:
        return _materialRoute(PickTypeFace(isPrimaryFont: (r.arguments as bool?) ?? true));

      case selectedFont:
        return _materialRoute(SelectedFontView(isPrimaryFont: (r.arguments as bool?) ?? true));

      default:
        return _materialRoute(const ColoredBox(color: Colors.red));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(builder: (_) => view);
  }
}
