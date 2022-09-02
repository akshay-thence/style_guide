import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:uuid/uuid.dart';

import '../../model/style_guide_model.dart';

part 'selected_style_guide_state.dart';

class SelectedStyleGuideCubit extends Cubit<SelectedStyleGuideState> {
  SelectedStyleGuideCubit() : super(SelectedStyleGuideState());

  final uuid = const Uuid();

  void createNewStyleGuide() {
    emit(state.copyWith(selectedStyleGuideModel: StyleGuideModel(id: uuid.v1())));
  }

  void createColorPallet(Color? color) {
    final newColor = SColor(
      primary: [color ?? AppColor.primary],
      semantic: [AppColor.success, AppColor.error, AppColor.warn],
      neutral: [
        AppColor.black,
        AppColor.grey,
        AppColor.lightGrey1,
        AppColor.lightGrey2,
        AppColor.lightGrey3,
        AppColor.lightGrey4,
        AppColor.white,
      ],
      secondary: [],
    );
    emit(state.copyWith(selectedStyleGuideModel: state.selectedStyleGuideModel?.copyWith(color: newColor)));
  }

  void addColor({required ColorType colorType, required Color color}) {
    final tempColor = state.selectedStyleGuideModel!.color!;

    switch (colorType) {
      case ColorType.primary:
        tempColor.primary = [...tempColor.primary!, color];
        break;
      case ColorType.secondary:
        tempColor.secondary = [...tempColor.secondary!, color];
        break;
      case ColorType.semantic:
        tempColor.semantic = [...tempColor.semantic!, color];
        break;
      case ColorType.neutral:
        tempColor.neutral = [...tempColor.neutral!, color];
        break;
    }
    emit(state.copyWith(selectedStyleGuideModel: state.selectedStyleGuideModel!.copyWith(color: tempColor)));
  }

  void editColor({required ColorType colorType, required int index, required Color color}) {
    final tempColor = state.selectedStyleGuideModel!.color!;

    switch (colorType) {
      case ColorType.primary:
        tempColor.primary?[index] = color;
        break;
      case ColorType.secondary:
        tempColor.secondary?[index] = color;
        break;
      case ColorType.semantic:
        tempColor.semantic?[index] = color;
        break;
      case ColorType.neutral:
        tempColor.neutral?[index] = color;
        break;
    }
    emit(state.copyWith(selectedStyleGuideModel: state.selectedStyleGuideModel!.copyWith(color: tempColor)));
  }

  void deleteColor({required ColorType colorType, required int index}) {
    final tempColor = state.selectedStyleGuideModel!.color!;

    switch (colorType) {
      case ColorType.primary:
        tempColor.primary!.removeAt(index);
        break;
      case ColorType.secondary:
        tempColor.secondary!.removeAt(index);
        break;
      case ColorType.semantic:
        tempColor.semantic!.removeAt(index);
        break;
      case ColorType.neutral:
        tempColor.neutral!.removeAt(index);
        break;
    }
    emit(state.copyWith(selectedStyleGuideModel: state.selectedStyleGuideModel!.copyWith(color: tempColor)));
  }
}
