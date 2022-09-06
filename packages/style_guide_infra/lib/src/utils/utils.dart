import 'package:flutter/material.dart';

FontWeight formatFontWeight(String weight) {
  var fontWeight = FontWeight.normal;

  if (weight[0] == '1') {
    fontWeight = FontWeight.w100;
  } else if (weight[0] == '2') {
    fontWeight = FontWeight.w200;
  } else if (weight[0] == '3') {
    fontWeight = FontWeight.w300;
  } else if (weight[0] == '4' || weight[0] == 'n') {
    fontWeight = FontWeight.w400;
  } else if (weight[0] == '5') {
    fontWeight = FontWeight.w500;
  } else if (weight[0] == '6') {
    fontWeight = FontWeight.w600;
  } else if (weight[0] == '7') {
    fontWeight = FontWeight.w700;
  } else if (weight[0] == '8') {
    fontWeight = FontWeight.w800;
  } else if (weight[0] == '9') {
    fontWeight = FontWeight.w900;
  }

  return fontWeight;
}

String formatFontName(String weight) {
  var fontWeight = '';
  var fontType = '';

  if (weight.toLowerCase().contains('italic')) {
    fontType = 'Italic';
  }

  if (weight[0] == '1') {
    fontWeight = 'Thin';
  } else if (weight[0] == '2') {
    fontWeight = 'ExtraLight';
  } else if (weight[0] == '3') {
    fontWeight = 'Light';
  } else if (weight[0] == '4' || weight[0] == 'r') {
    fontWeight = 'Regular';
  } else if (weight[0] == '5') {
    fontWeight = 'Medium';
  } else if (weight[0] == '6') {
    fontWeight = 'SemiBold';
  } else if (weight[0] == '7') {
    fontWeight = 'Bold';
  } else if (weight[0] == '8') {
    fontWeight = 'ExtraBold';
  } else if (weight[0] == '9') {
    fontWeight = 'Black';
  }

  return '$fontWeight $fontType';
}

FontStyle isItalic(String value) {
  return value.toLowerCase().contains('italic') ? FontStyle.italic : FontStyle.normal;
}
