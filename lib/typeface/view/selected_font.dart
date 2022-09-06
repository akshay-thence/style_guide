// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_cached_fonts/dynamic_cached_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import 'package:thence_style_guide/routes.dart';
import 'package:thence_style_guide/success/view/success_page.dart';
import 'package:thence_style_guide/typeface/view/pick_type_scale.dart';

import '../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../utils/bottom_sheets.dart';
import '../cubit/import_fonts_cubit.dart';

class SelectedFontView extends StatefulWidget {
  const SelectedFontView({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  State<SelectedFontView> createState() => _SelectedFontViewState();
}

class _SelectedFontViewState extends State<SelectedFontView> {
  @override
  void initState() {
    _loadCustomFonts();
    super.initState();
  }

  /// Load custom fonts from the urls
  void _loadCustomFonts() {
    final state = context.read<SelectedStyleGuideCubit>().state;
    final fonts = widget.isPrimaryFont ? state.primaryFont! : state.secondaryFont;
    final urls = fonts!.files.values.map((e) => e).toList();
    if (urls.length > 1) {
      DynamicCachedFonts.family(urls: urls, fontFamily: fonts.fontStyle).load();
    } else {
      DynamicCachedFonts(url: urls.first, fontFamily: fonts.fontStyle).load();
    }
  }

  Future<void> pickTypeScale() async {
    final fontPicked = await customBottomSheet<bool?>(
      context,
      child: PickTypeScalePage(isPrimaryFont: widget.isPrimaryFont),
    );

    if (fontPicked == true) {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          children: [
            const TypeHeaderWidget(
              stepValue: 'Step 1 of 2',
              title: 'Awesome! 👍',
              subTitle: "You've picked a typeface",
            ),
            const SizedBox(height: 48),
            _SelectedTypeface(isPrimaryFont: widget.isPrimaryFont),
            const Spacer(),
            AppButton(
              title: 'Select Font Weights',
              onTap: pickTypeScale,
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedTypeface extends StatelessWidget {
  const _SelectedTypeface({required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedStyleGuideCubit, SelectedStyleGuideState>(
      builder: (context, state) {
        var count = 0;
        var fontName = '';
        if (isPrimaryFont) {
          fontName = state.primaryFont!.fontStyle.toUpperCase();
          count = state.primaryFont!.variants.length;
        } else {
          fontName = state.secondaryFont!.fontStyle.toUpperCase();
          count = state.secondaryFont!.variants.length;
        }
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: kCardDecoration,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 5),
                    SvgPicture.asset(AppIcons.tickCircle),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        fontName.toUpperCase(),
                        style: AppTextStyle.title3,
                      ),
                    ),
                    Text(
                      '$count Styles Found',
                      style: AppTextStyle.caption1.copyWith(color: AppColor.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.lightGrey4,
                ),
                child: Column(
                  children: [
                    Text(
                      'Almost before we knew it, we had left the ground',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
