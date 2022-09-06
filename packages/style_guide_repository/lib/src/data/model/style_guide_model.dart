import 'dart:convert';

import 'package:flutter/material.dart';

class StyleGuideModel {
  final SColor? selectedColors;
  final SelectedFontModel? primaryFont;
  final SelectedFontModel? secondaryFont;

  StyleGuideModel({
    this.selectedColors,
    this.primaryFont,
    this.secondaryFont,
  });

  StyleGuideModel copyWith({
    SColor? selectedColors,
    SelectedFontModel? primaryFont,
    SelectedFontModel? secondaryFont,
  }) {
    return StyleGuideModel(
      selectedColors: selectedColors ?? this.selectedColors,
      primaryFont: primaryFont ?? this.primaryFont,
      secondaryFont: secondaryFont ?? this.secondaryFont,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'colors': selectedColors?.toMap(),
      'primaryFont': primaryFont?.toMap(),
      'secondaryFont': secondaryFont?.toMap(),
    };
  }

  factory StyleGuideModel.fromMap(Map<String, dynamic> map) {
    return StyleGuideModel(
      selectedColors: map['colors'] != null ? SColor.fromMap(map['colors'] as Map<String, dynamic>) : null,
      primaryFont:
          map['primaryFont'] != null ? SelectedFontModel.fromMap(map['primaryFont'] as Map<String, dynamic>) : null,
      secondaryFont:
          map['secondaryFont'] != null ? SelectedFontModel.fromMap(map['secondaryFont'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'StyleGuideModel(selectedColors: $selectedColors, primaryFont: $primaryFont, secondaryFont: $secondaryFont)';
}

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fontStyle': fontStyle,
      'variants': variants,
      'files': files,
      'selectedVariants': selectedVariants,
    };
  }

  factory SelectedFontModel.fromMap(Map<String, dynamic> map) {
    return SelectedFontModel(
      fontStyle: map['fontStyle'] as String,
      variants: List<String>.from((map['variants'])),
      files: Map<String, String>.from((map['files'])),
      selectedVariants: List<String>.from((map['selectedVariants'])),
    );
  }

  @override
  String toString() {
    return 'SelectedFontModel(fontStyle: $fontStyle, variants: $variants, files: $files, selectedVariants: $selectedVariants)';
  }

  final String fontStyle;
  final List<String> variants;
  final Map<String, String> files;
  final List<String> selectedVariants;
}

class SColor {
  SColor({
    this.primary,
    this.secondary,
    this.semantic,
    this.neutral,
  });

  SColor.fromMap(Map<String, dynamic> json) {
    primary = List<Color>.from((json['primary']).map((e) => Color(e)).toList());
    secondary = List<Color>.from((json['secondary']).map((e) => Color(e)).toList());
    semantic = List<Color>.from((json['semantic']).map((e) => Color(e)).toList());
    neutral = List<Color>.from((json['neutral']).map((e) => Color(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    data['semantic'] = semantic;
    data['neutral'] = neutral;
    return data;
  }

  SColor copyWith({
    List<Color>? primary,
    List<Color>? secondary,
    List<Color>? semantic,
    List<Color>? neutral,
  }) {
    return SColor(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      semantic: semantic ?? this.semantic,
      neutral: neutral ?? this.neutral,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primary': primary?.map((x) => x.value).toList() ?? [],
      'secondary': secondary?.map((x) => x.value).toList() ?? [],
      'semantic': semantic?.map((x) => x.value).toList() ?? [],
      'neutral': neutral?.map((x) => x.value).toList() ?? [],
    };
  }

  List<Color>? primary;
  List<Color>? secondary;
  List<Color>? semantic;
  List<Color>? neutral;
}
