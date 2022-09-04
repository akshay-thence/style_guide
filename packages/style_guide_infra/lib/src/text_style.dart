import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTextStyle {
  static TextStyle h1 = GoogleFonts.sora(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h2 = GoogleFonts.sora(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle title1 = GoogleFonts.sora(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.26,
  );
  static TextStyle title2 = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitle = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle title3 = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.lightGrey1,
  );
  static TextStyle body1 = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle body2 = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle body2Nor = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.grey,
  );
  static TextStyle caption1 = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColor.lightGrey1,
  );
  static TextStyle caption2 = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.grey,
  );
  static TextStyle button1 = GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600, color: AppColor.grey);
  static TextStyle button2 = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static TextStyle captionReg = GoogleFonts.sora(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
}
