import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import '../../style_guide_ui.dart';

class TypeHeaderWidget extends StatelessWidget {
  const TypeHeaderWidget({
    super.key,
    required this.stepValue,
    required this.title,
    required this.subTitle,
  });

  final String stepValue;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepCountWidget(value: stepValue),
        const SizedBox(height: 18),
        Text(
          title,
          style: AppTextStyle.h2,
        ),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: AppTextStyle.subtitle.copyWith(color: AppColor.lightGrey2),
        ),
      ],
    );
  }
}
