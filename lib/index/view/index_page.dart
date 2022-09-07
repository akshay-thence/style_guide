import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/routes.dart';

import '../../l10n/l10n.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomScaffold(
      appBar: CustomAppBar(
        trailingIcon: AppIcons.settings,
        onTrailingIconTap: () {
          Navigator.of(context).pushNamed(AppRouter.settings);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Style Guide',
                  style: AppTextStyle.h1,
                ),
                Text(
                  'Index',
                  style: GoogleFonts.sora(
                    fontSize: 36,
                    color: AppColor.lightGrey1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(
            _settings.length,
            (index) => _ListTile(
              index: index + 1,
              title: _settings[index].title,
              subTitle: _settings[index].subTitle,
              icon: _settings[index].icon,
              onTap: () => Navigator.of(context).pushNamed(_settings[index].routeName),
            ),
          )
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
    required this.index,
  });

  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        height: 78,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColor.primary20,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '0$index',
                    style: AppTextStyle.title2.copyWith(color: AppColor.primary),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyle.title2),
                    const SizedBox(height: 8),
                    Text(subTitle, style: AppTextStyle.caption1),
                  ],
                ),
              ),
              SvgPicture.asset(
                AppIcons.arrowRight,
                color: AppColor.lightGrey2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var _settings = <SettingEntity>[
  SettingEntity(
    icon: AppIcons.typeFace,
    title: 'Font Characters',
    subTitle: 'Bold, Semibold & Regular',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.typeScale,
    title: 'Components & Font Pairing',
    subTitle: 'Common Possible Text Pairs',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.colorsSwatch,
    title: 'Button Sizes & Styles',
    subTitle: 'Button combination and color',
    routeName: AppRouter.colors,
  ),
  SettingEntity(
    icon: AppIcons.cornerRadius,
    title: 'Icon Sizes',
    subTitle: 'Icons frames for UI',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.cornerRadius,
    title: 'Space Scale',
    subTitle: 'Setting up spacing rules',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.cornerRadius,
    title: 'Color Accessibility',
    subTitle: 'Checking contrast color combination',
    routeName: '',
  ),
];

class SettingEntity {
  SettingEntity({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.routeName,
  });

  final String title;
  final String subTitle;
  final String icon;
  final String routeName;
}
