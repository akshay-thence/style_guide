// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_style_guide_cubit.dart';

class SelectedStyleGuideState {
  SelectedStyleGuideState({
    this.selectedStyleGuideModel,
  });

  SelectedStyleGuideState copyWith({
    StyleGuideModel? selectedStyleGuideModel,
  }) {
    return SelectedStyleGuideState(
      selectedStyleGuideModel: selectedStyleGuideModel ?? this.selectedStyleGuideModel,
    );
  }

  StyleGuideModel? selectedStyleGuideModel;
}
