// ignore_for_file: use_build_context_synchronously, unawaited_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../../l10n/l10n.dart';
import '../../routes.dart';
import '../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../utils/bottom_sheets.dart';
import '../cubit/all_style_guide_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _pickTypeface() {
    Navigator.of(context).pushNamed(AppRouter.pickTypeface);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _pickTypeface,
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
