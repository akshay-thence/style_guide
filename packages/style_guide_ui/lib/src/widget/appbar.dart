// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/icons.dart';
import '../theme/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.centerTitle = false,
    this.showBackButton = true,
    this.height = 56,
    this.subTitle,
    this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(subTitle == null ? height : 78);

  final bool centerTitle;
  final bool showBackButton;
  final double height;
  final String? subTitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: subTitle == null ? height : 78,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.arrowBack,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: AppTextStyle.title1,
                      ),
                    if (subTitle != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        subTitle!,
                        style: AppTextStyle.caption1,
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}