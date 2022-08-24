part of 'color_cubit.dart';

class ColorState {
  const ColorState._({
    this.primary = const ['6A12E0'],
    this.secondary = const ['2CA9B1'],
    this.semantic = const ['E75147', 'FFD260', '2CB17F'],
    this.neutral = const ['0D1526', '3A4252', '6E7480', 'A1A7B3', 'DFE3EB', 'F7F9FC', 'FFFFFF'],
  });

  const ColorState.initial() : this._();

  final List<String> primary;
  final List<String> secondary;
  final List<String> semantic;
  final List<String> neutral;

  ColorState copyWith({
    List<String>? primary,
    List<String>? secondary,
    List<String>? semantic,
    List<String>? neutral,
  }) {
    return ColorState._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      semantic: semantic ?? this.semantic,
      neutral: neutral ?? this.neutral,
    );
  }
}
