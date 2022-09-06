// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.fast,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? AppColor.primary20 : null,
        border: Border.all(
          color: isSelected ? AppColor.primary20 : AppColor.lightGrey3,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: isSelected
          ? SvgPicture.asset(
              AppIcons.tick,
              color: AppColor.primary,
            )
          : const SizedBox.shrink(),
    );
  }
}
