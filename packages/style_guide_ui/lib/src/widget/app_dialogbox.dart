import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

class AppDialogBox extends StatelessWidget {
  const AppDialogBox({
    Key? key,
    this.icon,
    this.title,
    this.description,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryTap,
    this.onSecondaryTap,
  }) : super(key: key);

  final String? icon;
  final String? title;
  final String? description;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // dialogbox icon
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColor.primary20,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  icon!,
                  width: 24,
                  height: 24,
                  color: AppColor.primary,
                ),
              ),
              const SizedBox(height: 16),

              // dialog box title
              if (title != null) ...[
                Text(
                  title!,
                  style: AppTextStyle.h2,
                ),
                const SizedBox(height: 8),
              ],

              // description text
              if (description != null)
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.caption1,
                ),
              const SizedBox(height: 24),

              // primary button
              if (primaryButtonText != null) ...[
                AppButton(
                  title: primaryButtonText!,
                  onTap: onPrimaryTap,
                ),
                const SizedBox(height: 12),
              ],

              // secondary outline button
              if (secondaryButtonText != null)
                AppButton(
                  title: secondaryButtonText!,
                  buttonType: ButtonType.outlined,
                  onTap: onSecondaryTap,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
