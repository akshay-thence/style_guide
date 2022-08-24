import 'package:bloc/bloc.dart';

import '../view/color_page.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(const ColorState.initial());

  void addColor({required ColorType type, required String value}) {
    emit(state.copyWith(primary: [...state.primary, value]));
  }
}
