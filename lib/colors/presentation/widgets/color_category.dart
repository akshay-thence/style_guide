// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../../utils/bottom_sheets.dart';

class ColorCategoryWidget extends StatelessWidget {
  const ColorCategoryWidget({
    super.key,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.colorType,
    this.initiallyExpanded = false,
    this.showExpansionIcon = true,
    this.maxColorCount = 10,
  });

  final List<Color> colors;
  final String title;
  final String subtitle;
  final ColorType colorType;
  final bool initiallyExpanded;
  final bool showExpansionIcon;
  final int maxColorCount;

  @override
  Widget build(BuildContext context) {
    Future<void> _addNewColor() async {
      final newColor = await pickColor(context);
      if (newColor != null) {
        context.read<SelectedStyleGuideCubit>().addColor(colorType: colorType, color: newColor);
      }
    }

    Future<void> _editColor(int index) async {
      final newColor = await pickColor(context, color: colors[index]);
      if (newColor != null) {
        context.read<SelectedStyleGuideCubit>().editColor(colorType: colorType, color: newColor, index: index);
      }
    }

    Future<void> _deleteColor(int index) async {
      context.read<SelectedStyleGuideCubit>().deleteColor(colorType: colorType, index: index);
    }

    return CustomExpansionTile(
      initiallyExpanded: initiallyExpanded,
      disableTouch: !showExpansionIcon,
      controlAffinity: !showExpansionIcon ? ListTileControlAffinity.leading : null,
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
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 38),
          itemCount: colors.length >= maxColorCount ? maxColorCount : colors.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == colors.length && colors.length <= maxColorCount) {
              return _AddColorWidget(onTap: _addNewColor);
            }

            return ColorBlock(
              color: colors[index],
              onEditColor: () => _editColor(index),
              onDeleteColor: () => _deleteColor(index),
            );
          },
        ),
      ],
    );
  }
}

class _AddColorWidget extends StatelessWidget {
  const _AddColorWidget({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppIcons.dottedCircle,
                  width: 60,
                  height: 60,
                ),
                Center(
                  child: SvgPicture.asset(AppIcons.plus),
                )
              ],
            ),
          ),
          Text(
            'add a color',
            style: AppTextStyle.caption1,
          ),
        ],
      ),
    );
  }
}
