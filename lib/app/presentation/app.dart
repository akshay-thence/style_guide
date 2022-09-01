import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import '../../cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../home/presentation/home_page.dart';
import '../../l10n/l10n.dart';
import '../../routes.dart';
import 'cubit/all_style_guide_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
      child: MaterialApp(
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
      ),
    );
  }
}
