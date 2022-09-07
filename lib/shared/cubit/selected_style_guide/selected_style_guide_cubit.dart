// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/utils.dart';

part 'selected_style_guide_state.dart';

class SelectedStyleGuideCubit extends Cubit<SelectedStyleGuideState> {
  SelectedStyleGuideCubit({
    required this.styleGuideRepository,
  }) : super(SelectedStyleGuideState());

  final StyleGuideRepository styleGuideRepository;
  final uuid = const Uuid();

  void selectStyleGuide(StyleGuideModel data) {
    emit(
      SelectedStyleGuideState(
        primaryFont: data.primaryFont,
        secondaryFont: data.secondaryFont,
        selectedColors: data.selectedColors,
      ),
    );
  }

  void createNewStyleGuide() {
    log(jsonEncode(state.toMap().toString()));
    styleGuideRepository.createStyleGuide(state.toMap());
  }

  /// generate a default color pallet with primary color
  void createColorPallet(Color? color) {
    final newColor = kDefaultColor(color);
    emit(state.copyWith(selectedColors: newColor));
  }

  /// create a new color
  void addColor({required ColorType colorType, required Color color}) {
    final tempColor = state.selectedColors!;

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
    emit(state.copyWith(selectedColors: tempColor));
  }

  /// edit a color value
  void editColor({required ColorType colorType, required int index, required Color color}) {
    final tempColor = state.selectedColors!;

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
    emit(state.copyWith(selectedColors: tempColor));
  }

  /// delete an color form the list based on [ColorType]
  void deleteColor({required ColorType colorType, required int index}) {
    final tempColor = state.selectedColors!;

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
    emit(state.copyWith(selectedColors: tempColor));
  }

  /// emit state when user select a font
  /// font can be primary or secondary
  void selectFont({required GoogleFontModel selectedFont, required bool isPrimary}) {
    final font = SelectedFontModel(
      fontStyle: selectedFont.family!,
      variants: selectedFont.variants!,
      files: selectedFont.files!,
    );

    if (isPrimary) {
      emit(state.copyWith(primaryFont: font));
    } else {
      emit(state.copyWith(secondaryFont: font));
    }
  }

  /// update selected font's weight
  void selectFontWeight({required bool isPrimaryFont, required String fontWeight}) {
    var tempFontWeights = <String>[];

    if (isPrimaryFont) {
      tempFontWeights = state.primaryFont!.selectedVariants;
    } else {
      tempFontWeights = state.secondaryFont!.selectedVariants;
    }

    // add or remove fonts
    if (tempFontWeights.contains(fontWeight)) {
      tempFontWeights.remove(fontWeight);
    } else {
      tempFontWeights = [fontWeight, ...tempFontWeights];
    }

    // emit state
    if (isPrimaryFont) {
      emit(
        state.copyWith(
          primaryFont: state.primaryFont!.copyWith(selectedVariants: tempFontWeights),
        ),
      );
    } else {
      emit(
        state.copyWith(
          secondaryFont: state.secondaryFont!.copyWith(selectedVariants: tempFontWeights),
        ),
      );
    }
  }

  void generateDefaultFont({bool isPrimaryFont = true}) {
    if (isPrimaryFont) {
      emit(state.copyWith(primaryFont: kDefaultPrimaryFont));
    } else {
      emit(state.copyWith(secondaryFont: kDefaultSecondaryFont));
    }
  }
}
