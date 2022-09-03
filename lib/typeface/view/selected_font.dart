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
    // print();
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TypeHeaderWidget(
            stepValue: 'Step 1 of 2',
            title: 'Awesome! 👍',
            subTitle: "You've picked a typeface",
          ),
          const SizedBox(height: 48),
          IconButton(
            onPressed: _initCustomFonts,
            icon: const Icon(Icons.add),
          ),
          BlocBuilder<ImportFontsCubit, ImportFontsState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppIcons.tickCircle),
                        Text(state.primaryFont!.fontStyle),
                        Text('${state.primaryFont!.variants.length} Styles Found')
                      ],
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
                          // Text(
                          //   'Almost before we knew it, we had left the ground',
                          //   style: TextStyle(
                          //     fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                          //     fontWeight: FontWeight.w100,
                          //   ),
                          // ),
                          // Text(
                          //   'Almost before we knew it, we had left the ground',
                          //   style: TextStyle(
                          //     fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                          //     fontWeight: FontWeight.w200,
                          //   ),
                          // ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Almost before we knew it, we had left the ground',
                            style: TextStyle(
                              fontFamily: context.read<ImportFontsCubit>().state.primaryFont!.fontStyle,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
// {
//   FontWeight.w100: 'Thin',
//   FontWeight.w200: 'ExtraLight',
//   FontWeight.w300: 'Light',
//   FontWeight.w400: 'Regular',
//   FontWeight.w500: 'Medium',
//   FontWeight.w600: 'SemiBold',
//   FontWeight.w700: 'Bold',
//   FontWeight.w800: 'ExtraBold',
//   FontWeight.w900: 'Black',
// }
