import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/routes.dart';

import '../../l10n/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PixelPerfect(
      assetPath: 'assets/screenshots/Settings.png',
      scale: 2,
      child: CustomScaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                l10n.settings,
                style: AppTextStyle.h1,
              ),
            ),
            ...List.generate(
              _settings.length,
              (index) => _ListTile(
                title: _settings[index].title,
                subTitle: _settings[index].subTitle,
                icon: _settings[index].icon,
                onTap: () => Navigator.of(context).pushNamed(_settings[index].routeName),
              ),
            )
          ],
        ),
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
  });

  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback onTap;

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
                  child: SvgPicture.asset(
                    icon,
                    height: 24,
                    width: 24,
                    color: AppColor.primary,
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

final _settings = <SettingEntity>[
  SettingEntity(
    icon: AppIcons.typeFace,
    title: 'Typeface',
    subTitle: 'Primary, display typeface',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.typeScale,
    title: 'Typescale',
    subTitle: 'Weight, Size, character spacing...',
    routeName: '',
  ),
  SettingEntity(
    icon: AppIcons.colorsSwatch,
    title: 'Colors',
    subTitle: 'Veiw pallate primary, secondary..',
    routeName: AppRouter.colors,
  ),
  SettingEntity(
    icon: AppIcons.cornerRadius,
    title: 'Corner radius',
    subTitle: 'Buttons, chips, input fields...',
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
