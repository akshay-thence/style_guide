import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import '../../l10n/l10n.dart';
import '../../routes.dart';
import '../../settings/settings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColor.mcprimary,
        backgroundColor: AppColor.background,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      onGenerateRoute: AppRouter().onGenerateRoute,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SettingPage(),
    );
  }
}
