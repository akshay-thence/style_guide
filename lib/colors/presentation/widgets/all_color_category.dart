// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:thence_style_guide/colors/presentation/widgets/color_category.dart';

import '../../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';

class AllColorCategoryWidget extends StatelessWidget {
  const AllColorCategoryWidget({
    super.key,
    this.initiallyExpanded = false,
    this.showExpandedIcon = true,
  });

  final bool initiallyExpanded;
  final bool showExpandedIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedStyleGuideCubit, SelectedStyleGuideState>(
      builder: (context, state) {
        final color = state.selectedStyleGuideModel!.color!;
        return Column(
          children: [
            const SizedBox(height: 16),
            ColorCategoryWidget(
              maxColorCount: 2,
              colors: color.primary!,
              title: 'Primary',
              subtitle: 'Brand color used for buttons and actions',
              colorType: ColorType.primary,
              initiallyExpanded: initiallyExpanded,
              showExpansionIcon: showExpandedIcon,
            ),
            const SizedBox(height: 10),
            ColorCategoryWidget(
              maxColorCount: 3,
              colors: color.semantic!,
              title: 'Semantic',
              subtitle: 'Success, error, warning, information',
              colorType: ColorType.semantic,
              initiallyExpanded: initiallyExpanded,
              showExpansionIcon: showExpandedIcon,
            ),
            const SizedBox(height: 10),
            ColorCategoryWidget(
              maxColorCount: 15,
              colors: color.neutral!,
              title: 'Neutral',
              subtitle: 'Text, container boarder, system icon',
              colorType: ColorType.neutral,
              initiallyExpanded: initiallyExpanded,
              showExpansionIcon: showExpandedIcon,
            ),
            const SizedBox(height: 10),
            ColorCategoryWidget(
              maxColorCount: 15,
              colors: color.secondary!,
              title: 'Secondary Colour',
              subtitle: 'For highlight, acents, tags and graphs',
              colorType: ColorType.secondary,
              initiallyExpanded: initiallyExpanded,
              showExpansionIcon: showExpandedIcon,
            ),
          ],
        );
      },
    );
  }
}
