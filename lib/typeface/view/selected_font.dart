// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_cached_fonts/dynamic_cached_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../cubit/import_fonts_cubit.dart';

class SelectedFontView extends StatefulWidget {
  const SelectedFontView({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  State<SelectedFontView> createState() => _SelectedFontViewState();
}

class _SelectedFontViewState extends State<SelectedFontView> {
  void _initCustomFonts() {
    final foo = context.read<ImportFontsCubit>().state.primaryFont!;
    final urls = foo.files.values.map((e) => e).toList();
    if (urls.length > 1) {
      DynamicCachedFonts.family(urls: urls, fontFamily: foo.fontStyle).load();
    } else {
      DynamicCachedFonts(url: urls.first, fontFamily: foo.fontStyle).load();
    }
  }

  @override
  void initState() {
    _initCustomFonts();
    super.initState();
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
            const _SelectedTypeface(),
            const Spacer(),
            AppButton(
              title: 'Select Font Weights',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedTypeface extends StatelessWidget {
  const _SelectedTypeface();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportFontsCubit, ImportFontsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffA1A7B3).withOpacity(0.16),
                blurRadius: 16,
                offset: const Offset(0, 2),
              )
            ],
          ),
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
                        state.primaryFont!.fontStyle.toUpperCase(),
                        style: AppTextStyle.title3,
                      ),
                    ),
                    Text(
                      '${state.primaryFont!.variants.length} Styles Found',
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
                        fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
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
