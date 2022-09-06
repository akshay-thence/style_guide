import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/routes.dart';

import '../../success/view/success_page.dart';
import '../cubit/import_fonts_cubit.dart';

/// This screen is used to create primary font and secondary fonts
class PickTypeFace extends StatefulWidget {
  const PickTypeFace({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  State<PickTypeFace> createState() => _PickTypeFaceState();
}

class _PickTypeFaceState extends State<PickTypeFace> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!widget.isPrimaryFont) {
        Future<void>.delayed(Durations.fastest).then(
          (value) => showSecondaryFontDialogBox(),
        );
      }
    });
  }

  /// Select secondary font case
  /// if user is picking secondary font
  void showSecondaryFontDialogBox() {
    final child = AppDialogBox(
      icon: AppIcons.secondaryFont,
      title: 'Secondary font?',
      description: 'Do you want a secondary display font\nfor your product?',
      primaryButtonText: 'Yes,  I want',
      secondaryButtonText: "No, I'll skip",
      onPrimaryTap: () {
        Navigator.of(context).pop();
      },
      onSecondaryTap: navigateToSummaryPage,
    );

    showAppDialogBox<void>(context, child, barrierDismissible: false);
  }

  void navigateToSummaryPage() {
    Navigator.of(context).pushNamed(AppRouter.typeFaceSummary);
  }

  // if user wants the default primary
  void _generateDefaultFont({bool isPrimaryFont = true}) {
    if (isPrimaryFont) {
      context.read<ImportFontsCubit>().generateDefaultFont(isPrimaryFont: isPrimaryFont);
      navigatorToSuccessScreen();
    }
  }

  // success screen
  void navigatorToSuccessScreen() {
    final arguments = SuccessScreenParams(
      title: 'Awesome!',
      subTitle: widget.isPrimaryFont ? 'Primary Fonts Selected' : 'Secondary Fonts Selected',
      onDone: successPageCallback,
    );

    Navigator.of(context).pushNamed(
      AppRouter.successPage,
      arguments: arguments,
    );
  }

  // pick secondary font
  void successPageCallback() {
    if (widget.isPrimaryFont) {
      Navigator.of(context).pushReplacementNamed(
        AppRouter.pickTypeface,
        arguments: false,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(
        AppRouter.typeFaceSummary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TypeHeaderWidget(
            stepValue: 'Step 1 of 2',
            title: widget.isPrimaryFont ? 'Go Ahead 👍' : 'Impressive! 😎',
            subTitle: widget.isPrimaryFont ? "Let's pick a primary Typeface" : 'Choose a secondary font',
          ),
          _buildSearchBar(),
          _buildImportFont(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _generateDefaultFont(isPrimaryFont: widget.isPrimaryFont),
            child: SizedBox(
              height: 64,
              child: Text(
                widget.isPrimaryFont ? "I'm Happy with default font" : "I don't want secondary font",
                style: AppTextStyle.button2.copyWith(color: AppColor.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Hero _buildSearchBar() {
    final prefixIcon = SvgPicture.asset(
      AppIcons.search,
      color: AppColor.lightGrey2,
      width: 16,
      height: 16,
    );

    final suffixIcon = Image.asset(
      AppImage.googleFontImage,
      scale: 2,
    );

    void _searchFonts() {
      Navigator.of(context).pushNamed(AppRouter.searchFonts, arguments: widget.isPrimaryFont);
    }

    return Hero(
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
