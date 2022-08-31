// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import 'package:style_guide_ui/style_guide_ui.dart';

import 'package:thence_style_guide/l10n/l10n.dart';

import 'widgets/all_color_category.dart';

class ViewColorPage extends StatelessWidget {
  const ViewColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColorView();
  }
}

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomScaffold(
      appBar: CustomAppBar(title: l10n.colors),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 16),
            AllColorCategoryWidget(),
          ],
        ),
      ),
    );
  }
}
