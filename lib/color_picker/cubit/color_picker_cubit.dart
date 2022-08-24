import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'color_picker_state.dart';

class ColorPickerCubit extends Cubit<ColorPickerState> {
  ColorPickerCubit() : super(const ColorPickerState.initial());

  void changeColor(Color color) {
    emit(state.copyWith(selected: color));
  }

  void updateTextFieldFocus({required bool isFocused}) {
    emit(state.copyWith(textFieldFocused: isFocused));
  }
}
