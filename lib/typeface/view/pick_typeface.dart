import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/routes.dart';

class PickTypeFace extends StatelessWidget {
  const PickTypeFace({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  Widget build(BuildContext context) {
    final prefixIcon = SvgPicture.asset(AppIcons.search, color: AppColor.lightGrey2, width: 16, height: 16);
    final suffixIcon = Image.asset(AppImage.googleFontImage, scale: 2);

    void _searchFonts() {
      Navigator.of(context).pushNamed(AppRouter.searchFonts);
    }

    return CustomScaffold(
      appBar: CustomAppBar(
        trailingIcon: AppIcons.settings,
        onTrailingIconTap: () {},
      ),
      body: Column(
        children: [
          Row(),
          const SizedBox(height: 10),
          TypeHeaderWidget(
            stepValue: 'Step 1 of 2',
            title: isPrimaryFont ? 'Go Ahead 👍' : 'Impressive! 😎',
            subTitle: isPrimaryFont ? "Let's pick a primary Typeface" : 'Choose a secondary font',
          ),
          Hero(
            tag: 'search_font',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: CustomInputFields(
                onTap: _searchFonts,
                hintText: 'Search ',
                readOnly: true,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
          _buildImportFont(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: SizedBox(
              height: 64,
              child: Text(
                "I'm Happy with default font",
                style: AppTextStyle.button2.copyWith(color: AppColor.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportFont() {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [5],
            radius: const Radius.circular(12),
            color: AppColor.lightGrey3,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                height: 144,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.importFiles),
                    const SizedBox(height: 12),
                    Text(
                      'Import files',
                      style: AppTextStyle.body1.copyWith(color: AppColor.primary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Supported formate: OTF, TTF, OTC or TTC',
                      style: AppTextStyle.caption1.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
