// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_style_guide_cubit.dart';

class SelectedStyleGuideState {
  SelectedStyleGuideState({
    this.selectedColors,
    this.primaryFont,
    this.secondaryFont,
  });

  SelectedStyleGuideState copyWith({
    SColor? selectedColors,
    SelectedFontModel? primaryFont,
    SelectedFontModel? secondaryFont,
  }) {
    return SelectedStyleGuideState(
      selectedColors: selectedColors ?? this.selectedColors,
      primaryFont: primaryFont ?? this.primaryFont,
      secondaryFont: secondaryFont ?? this.secondaryFont,
    );
  }

  final SColor? selectedColors;
  final SelectedFontModel? primaryFont;
  final SelectedFontModel? secondaryFont;
}
