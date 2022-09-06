// ignore_for_file: use_build_context_synchronously, unawaited_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/l10n/l10n.dart';
import 'package:thence_style_guide/routes.dart';
import 'package:thence_style_guide/utils/bottom_sheets.dart';

import '../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';

class TypeFaceSummaryPage extends StatefulWidget {
  const TypeFaceSummaryPage({super.key});

  @override
  State<TypeFaceSummaryPage> createState() => _TypeFaceSummaryPageState();
}

class _TypeFaceSummaryPageState extends State<TypeFaceSummaryPage> {
  void createColor() {
    final l10n = context.l10n;

    showAppDialogBox<void>(
      context,
      AppDialogBox(
        icon: AppIcons.colorAdd,
        title: l10n.dialogBoxAddPrimaryColorTitle,
        description: l10n.dialogBoxAddPrimaryColorDesc,
        primaryButtonText: l10n.add,
        secondaryButtonText: l10n.skip,
        onPrimaryTap: () async {
          Navigator.of(context).pop();
          await Future<void>.delayed(Durations.fastest);
          await pickPrimaryColor();
        },
        onSecondaryTap: () async {
          Navigator.of(context).pop();
          await Future<void>.delayed(Durations.fastest);
          context.read<SelectedStyleGuideCubit>().createColorPallet(null);
          Navigator.of(context).pushNamed(AppRouter.createColor);
        },
      ),
    );
  }

  Future<void> pickPrimaryColor() async {
    final pickedColor = await pickColor(context);
    if (pickedColor != null) {
      await Future<void>.delayed(Durations.fast);
      context.read<SelectedStyleGuideCubit>().createColorPallet(pickedColor);
      showSuccessScreen();
    }
  }

  void showSuccessScreen() {
    final l10n = context.l10n;

    showAppDialogBox<void>(
      context,
      AppDialogBox(
        icon: AppIcons.colorAdded,
        title: l10n.dialogBoxColorAddedTitle,
        description: l10n.dialogBoxColorAddedDesc,
        primaryButtonText: l10n.done,
        onPrimaryTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(AppRouter.createColor);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            children: [
              const TypeHeaderWidget(
                stepValue: 'Step 1 of 2',
                title: 'Congratulation! 🎉',
                subTitle: "You're done with typeface & styles",
              ),
              const SizedBox(height: 32),
              Text(
                'Summary',
                style: AppTextStyle.title2,
              ),
              const SizedBox(height: 32),
              BlocBuilder<SelectedStyleGuideCubit, SelectedStyleGuideState>(
                builder: (context, state) {
                  return state.primaryFont != null ? _SummaryCard(fontModel: state.primaryFont!) : const SizedBox();
                },
              ),
              const SizedBox(height: 48),
              BlocBuilder<SelectedStyleGuideCubit, SelectedStyleGuideState>(
                builder: (context, state) {
                  return state.secondaryFont != null ? _SummaryCard(fontModel: state.secondaryFont!) : const SizedBox();
                },
              ),
              const SizedBox(height: 40),
              AppButton(
                title: 'Proceed to Step 2',
                onTap: createColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.fontModel});

  final SelectedFontModel fontModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.primary,
                ),
              ),
              child: SvgPicture.asset(AppIcons.tickCircle),
            ),
            const SizedBox(width: 8),
            Text('PRIMARY : ${fontModel.fontStyle}', style: AppTextStyle.title3),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: kCardDecoration,
          padding: const EdgeInsets.all(24),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fontModel.selectedVariants.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const Divider(height: 25),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    formatFontName(fontModel.selectedVariants[index]),
                    style: AppTextStyle.caption1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Almost before we knew it, we had left the ground',
                    style: TextStyle(
                      fontFamily: fontModel.fontStyle,
                      fontWeight: formatFontWeight(fontModel.selectedVariants[index]),
                      fontStyle: isItalic(fontModel.selectedVariants[index]),
                      fontSize: 24,
                      height: 1.5,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
