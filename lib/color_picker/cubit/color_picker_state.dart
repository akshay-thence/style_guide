part of 'color_picker_cubit.dart';

class ColorPickerState {
  const ColorPickerState._({
    this.selectedColor,
    this.textFieldFocused = false,
  });

  const ColorPickerState.initial() : this._();

  ColorPickerState copyWith({
    Color? selected,
    bool? textFieldFocused,
  }) {
    return ColorPickerState._(
      selectedColor: selected ?? this.selectedColor,
      textFieldFocused: textFieldFocused ?? this.textFieldFocused,
    );
  }

  final Color? selectedColor;
  final bool textFieldFocused;
}
