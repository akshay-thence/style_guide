part of 'color_picker_cubit.dart';

class ColorPickerState {
  const ColorPickerState._({
    this.selectedColor,
    this.color,
    this.textFieldFocused = false,
  });

  const ColorPickerState.initial() : this._();

  ColorPickerState copyWith({
    Color? color,
    Color? selectedColor,
    bool? textFieldFocused,
  }) {
    return ColorPickerState._(
      color: color ?? this.color,
      selectedColor: selectedColor ?? this.selectedColor,
      textFieldFocused: textFieldFocused ?? this.textFieldFocused,
    );
  }

  final Color? color;
  final Color? selectedColor;
  final bool textFieldFocused;
}
