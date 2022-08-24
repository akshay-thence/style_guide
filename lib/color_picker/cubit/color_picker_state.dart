part of 'color_picker_cubit.dart';

class ColorPickerState {
  const ColorPickerState._({
    this.selected,
    this.textFieldFocused = false,
  });

  const ColorPickerState.initial() : this._();

  ColorPickerState copyWith({
    Color? selected,
    bool? textFieldFocused,
  }) {
    return ColorPickerState._(
      selected: selected ?? this.selected,
      textFieldFocused: textFieldFocused ?? this.textFieldFocused,
    );
  }

  final Color? selected;
  final bool textFieldFocused;
}
