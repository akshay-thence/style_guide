/// Model call to save the state of selected fonts
class SelectedFontModel {
  SelectedFontModel({
    required this.fontStyle,
    required this.variants,
    required this.files,
    this.selectedVariants = const [],
  });

  SelectedFontModel copyWith({
    String? fontStyle,
    List<String>? variants,
    Map<String, String>? files,
    List<String>? selectedVariants,
  }) {
    return SelectedFontModel(
      fontStyle: fontStyle ?? this.fontStyle,
      variants: variants ?? this.variants,
      files: files ?? this.files,
      selectedVariants: selectedVariants ?? this.selectedVariants,
    );
  }

  final String fontStyle;
  final List<String> variants;
  final Map<String, String> files;
  final List<String> selectedVariants;
}
