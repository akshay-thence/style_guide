// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

import '../../home/home.dart';
import '../../l10n/l10n.dart';
import '../../routes.dart';
import '../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.googleFontsRepository,
  });

  final GoogleFontsRepository googleFontsRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return RepositoryProvider.value(
      value: googleFontsRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SelectedStyleGuideCubit>(
            create: (BuildContext context) => SelectedStyleGuideCubit(),
          ),
          BlocProvider<AllStyleGuideCubit>(
            create: (BuildContext context) => AllStyleGuideCubit(
              selectedStyleGuideCubit: context.read<SelectedStyleGuideCubit>(),
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const HomePage(),
    );
  }
}
