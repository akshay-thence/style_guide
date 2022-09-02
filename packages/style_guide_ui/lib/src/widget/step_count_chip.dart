import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class StepCountWidget extends StatelessWidget {
  const StepCountWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.primary20,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        value,
        style: AppTextStyle.caption2,
      ),
    );
  }
}
