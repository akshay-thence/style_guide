import 'package:flutter/material.dart';

class AppColor {
  // Primary material color
  static MaterialColor mcprimary = MaterialColor(primary.value, const <int, Color>{
    50: Color(0xFFFFF0E9),
    100: Color(0xFFFFDAC9),
    200: Color(0xFFFFC2A5),
    300: Color(0xFFFFA981),
    400: Color(0xFFFF9666),
    500: primary,
    600: Color(0xFFFF7C44),
    700: Color(0xFFFF713B),
    800: Color(0xFFFF6733),
    900: Color(0xFFFF5423),
  });

  // Primary shades
  static const Color primary = Color(0xffFF844B);
  static const Color primary80 = Color(0xffFF9D6F);
  static const Color primary60 = Color(0xffFFB593);
  static const Color primary40 = Color(0xffFFCEB7);
  static const Color primary20 = Color(0xffFFE6DB);

  // Neutral shades
  static const black = Color(0xff0D0E26);
  static const black80 = Color(0xCC0D1526);
  static const grey = Color(0xff3A4252);
  static const lightGrey1 = Color(0xff6E7480);
  static const lightGrey2 = Color(0xffA1A7B3);
  static const lightGrey3 = Color(0xffDFE3EB);
  static const lightGrey4 = Color(0xffFCFBFA);
  static const white = Color(0xffFFFFFF);

  // Supporting colors
  static const success = Color(0xff1AA36F);
  static const successBg = Color(0xff99FFD1);
  static const error = Color(0xffED1455);
  static const errorGb = Color(0xffFC9F9F);
  static const warn = Color(0xffFFD260);

  static const background = Color(0xffE5E5E5);
}

Color converHexToColor(String color) {
  var hexColor = color.replaceAll('#', '');
  late Color mColor;

  if (hexColor.length == 6) {
    hexColor = 'FF$color';
  }
  if (hexColor.length == 8) {
    mColor = Color(int.parse(hexColor, radix: 16));
  }
  return mColor;
}
