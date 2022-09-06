import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import '../../shared/model/selected_font.dart';
import '../../utils/utils.dart';
import '../cubit/import_fonts_cubit.dart';

class PickTypeScalePage extends StatelessWidget {
  const PickTypeScalePage({super.key, required this.isPrimaryFont});

  final bool isPrimaryFont;

  @override
  Widget build(BuildContext context) {
    bool isValid(int length) {
      return isPrimaryFont ? length == 3 : (length >= 1 && length <= 3);
    }

    final height = MediaQuery.of(context).size.height * 0.8;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
          child: BlocBuilder<ImportFontsCubit, ImportFontsState>(
            builder: (context, state) {
              final selectedFont = isPrimaryFont ? state.primaryFont! : state.secondaryFont!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TypeHeaderWidget(
                    stepValue: 'Step 1 of 2',
                    title: 'Great! 👌',
                    subTitle: isPrimaryFont ? 'Select 3 Font Weights' : 'Select 1-3 Font Weights',
                  ),
                  const SizedBox(height: 32),
                  _buildFontWeights(selectedFont),
                  const SizedBox(height: 24),
                  AppButton(
                    buttonType:
                        isValid(selectedFont.selectedVariants.length) ? ButtonType.primary : ButtonType.disabled,
                    title: 'Next',
                    onTap: () {
                      Navigator.of(context).pop(isValid(selectedFont.selectedVariants.length));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFontWeights(SelectedFontModel selectedFont) {
    void _selectFontWeights(BuildContext context, int index) {
      AppHaptics.lightImpact();
      context
          .read<ImportFontsCubit>()
          .selectFontWeight(isPrimaryFont: isPrimaryFont, fontWeight: selectedFont.variants[index]);
    }

    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: selectedFont.variants.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _selectFontWeights(context, index),
            child: SizedBox(
              height: 34,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedFont.fontStyle} ${formatFontName(selectedFont.variants[index])}',
                    style: TextStyle(
                      fontFamily: selectedFont.fontStyle,
                      fontStyle: isItalic(selectedFont.variants[index]),
                      fontWeight: formatFontWeight(
                        selectedFont.variants[index],
                      ),
                    ),
                  ),
                  CustomCheckBox(
                    isSelected: selectedFont.selectedVariants.contains(selectedFont.variants[index]),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
