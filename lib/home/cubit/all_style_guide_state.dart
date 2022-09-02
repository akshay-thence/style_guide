part of 'all_style_guide_cubit.dart';

class StyleGuideState {
  StyleGuideState({this.styleGuides = const []});

  StyleGuideState copyWith({
    List<StyleGuideModel>? styleGuides,
  }) {
    return StyleGuideState(
      styleGuides: styleGuides ?? this.styleGuides,
    );
  }

  final List<StyleGuideModel> styleGuides;
}
