// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../cubit/import_fonts_cubit.dart';

class SelectedFontView extends StatelessWidget {
  const SelectedFontView({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TypeHeaderWidget(
            stepValue: 'Step 1 of 2',
            title: 'Awesome! 👍',
            subTitle: 'You’ve picked a typeface',
          ),
          SizedBox(height: 48),
          BlocBuilder<ImportFontsCubit, ImportFontsState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
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
                      child: const Text(
                        'Almost before we knew it, we had left the ground',
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
