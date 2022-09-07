import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../../routes.dart';
import '../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';
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
  void initState() {
    super.initState();
    context.read<AllStyleGuideCubit>().fetchAllStyleGuide();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
        title: 'Home',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickTypeface,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AllStyleGuideCubit, StyleGuideState>(
        builder: (context, state) {
          if (state.status == APIStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.styleGuides.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  context.read<SelectedStyleGuideCubit>().selectStyleGuide(state.styleGuides[index]);
                  Navigator.of(context).pushNamed(AppRouter.indexPage);
                },
                title: Text(
                  "${state.styleGuides[index].primaryFont!.fontStyle} ${state.styleGuides[index].secondaryFont?.fontStyle ?? ''}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
