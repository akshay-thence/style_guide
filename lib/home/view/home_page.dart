// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../../app/cubit/all_style_guide_cubit.dart';
import '../../cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../l10n/l10n.dart';
import '../../routes.dart';
import '../../utils/bottom_sheets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createColor() {
    final l10n = context.l10n;

    showAppDialogBox<void>(
      context,
      AppDialogBox(
        icon: AppIcons.colorAdd,
        title: l10n.dialogBoxAddPrimaryColorTitle,
        description: l10n.dialogBoxAddPrimaryColorDesc,
        primaryButtonText: l10n.add,
        secondaryButtonText: l10n.skip,
        onPrimaryTap: () async {
          Navigator.of(context).pop();
          await Future<void>.delayed(Durations.fastest);
          await pickPrimaryColor();
        },
        onSecondaryTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Future<void> pickPrimaryColor() async {
    final primaryColor = await pickColor(context);
    if (primaryColor != null) {
      await Future<void>.delayed(Durations.fast);
      context.read<SelectedStyleGuideCubit>().createNewStyleGuide();
      context.read<SelectedStyleGuideCubit>().createColorPallet(primaryColor);
      showSuccessScreen();
    }
  }

  void showSuccessScreen() {
    final l10n = context.l10n;

    showAppDialogBox<void>(
      context,
      AppDialogBox(
        icon: AppIcons.colorAdded,
        title: l10n.dialogBoxColorAddedTitle,
        description: l10n.dialogBoxColorAddedDesc,
        primaryButtonText: l10n.done,
        onPrimaryTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(AppRouter.createColor);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createColor,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AllStyleGuideCubit, StyleGuideState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.styleGuides.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.styleGuides[index].id.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
