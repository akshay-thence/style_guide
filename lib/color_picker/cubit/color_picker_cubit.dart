import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'color_picker_state.dart';

class ColorPickerCubit extends Cubit<ColorPickerState> {
  ColorPickerCubit() : super(const ColorPickerState.initial());

  void changeColor(Color color) {
    if (color == state.selectedColor) return;
    emit(state.copyWith(selectedColor: color, color: state.color ?? color));
  }

  void updateTextFieldFocus({required bool isFocused}) {
    if (isFocused == state.textFieldFocused) return;
    emit(state.copyWith(textFieldFocused: isFocused));
  }

  void resetColorToPreviousState() {
    emit(state.copyWith(selectedColor: state.color));
  }
}
