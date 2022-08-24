// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import 'package:thence_style_guide/l10n/l10n.dart';

import '../../utils/bottom_sheets.dart';
import '../cubit/color_cubit.dart';

enum ColorType { primary, secondary, semantic, neutral }

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorCubit(),
      child: const ColorView(),
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomScaffold(
      appBar: CustomAppBar(title: l10n.colors),
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _ColorListWidget(
                  colors: state.primary,
                  title: 'Primary',
                  subtitle: 'Brand color used for buttons and actions',
                  colorType: ColorType.primary,
                ),
                const SizedBox(height: 10),
                _ColorListWidget(
                  colors: state.semantic,
                  title: 'Semantic',
                  subtitle: 'Success, error, warning, information',
                  colorType: ColorType.semantic,
                ),
                const SizedBox(height: 10),
                _ColorListWidget(
                  colors: state.neutral,
                  title: 'Neutral',
                  subtitle: 'Text, container boarder, system icon',
                  colorType: ColorType.neutral,
                ),
                const SizedBox(height: 10),
                _ColorListWidget(
                  colors: state.secondary,
                  title: 'Secondary Colour',
                  subtitle: 'For highlight, acents, tags and graphs',
                  colorType: ColorType.secondary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ColorListWidget extends StatelessWidget {
  const _ColorListWidget({
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.colorType,
  });

  final List<String> colors;
  final String title;
  final String subtitle;
  final ColorType colorType;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: Text(
        title,
        style: AppTextStyle.title2,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyle.caption1,
      ),
      trailing: SvgPicture.asset(
        AppIcons.arrowDown,
        color: AppColor.lightGrey2,
      ),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 156 / 138,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 38),
          itemCount: colors.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == colors.length) {
              return IconButton(
                onPressed: () => addNewColor(context, colorType),
                icon: const Icon(Icons.add),
              );
            }

            return ColorBlock(color: converHexToColor(colors[index]));
          },
        ),
      ],
    );
  }

  void addNewColor(BuildContext context, ColorType colorType) {
    final res = pickColor(context);
  }
}
