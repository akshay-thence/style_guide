// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

enum ButtonType { primary, outlined, disabled }

enum ButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.onTap,
    this.buttonType = ButtonType.primary,
    this.buttonSize = ButtonSize.medium,
  }) : super(key: key);

  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = buttonType == ButtonType.primary
        ? AppColor.primary60
        : buttonType == ButtonType.outlined
            ? Colors.transparent
            : AppColor.lightGrey3;

    double height = buttonSize == ButtonSize.large
        ? 56
        : buttonSize == ButtonSize.medium
            ? 48
            : 36;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
      horizontal: buttonSize == ButtonSize.large
          ? 55.0
          : buttonSize == ButtonSize.medium
              ? 35.0
              : 16.0,
      vertical: buttonSize == ButtonSize.large
          ? 19.0
          : buttonSize == ButtonSize.medium
              ? 15.0
              : 9.0,
    );

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          AppHaptics.lightImpact();
          onTap!();
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.1),
        child: AnimatedContainer(
          duration: Durations.fastest,
          padding: padding,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(16),
            border: buttonType == ButtonType.outlined ? Border.all(color: AppColor.lightGrey3) : null,
          ),
          child: Center(child: Text(title, style: AppTextStyle.button1)),
        ),
      ),
    );
  }
}
