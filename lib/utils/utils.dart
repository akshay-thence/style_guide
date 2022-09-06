import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

import '../shared/model/selected_font.dart';
import '../shared/model/style_guide_model.dart';

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

final kDefaultPrimaryFont = SelectedFontModel(
  fontStyle: 'Sora',
  variants: ['100', '200', '300', 'regular', '500', '600', '700', '800'],
  files: {
    '100': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdSn3-KIwNhBti0.ttf',
    '200': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSfSnn-KIwNhBti0.ttf',
    '300': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmScMnn-KIwNhBti0.ttf',
    'regular': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdSnn-KIwNhBti0.ttf',
    '500': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdgnn-KIwNhBti0.ttf',
    '600': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSeMmX-KIwNhBti0.ttf',
    '700': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSe1mX-KIwNhBti0.ttf',
    '800': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSfSmX-KIwNhBti0.ttf'
  },
  selectedVariants: ['regular', '500', '700'],
);

final kDefaultSecondaryFont = SelectedFontModel(
  fontStyle: 'PT Serif',
  variants: ['regular', 'italic', '700', '700italic'],
  files: {
    'regular': 'http://fonts.gstatic.com/s/ptserif/v17/EJRVQgYoZZY2vCFuvDFRxL6ddjb-.ttf',
    'italic': 'http://fonts.gstatic.com/s/ptserif/v17/EJRTQgYoZZY2vCFuvAFTzrq_cyb-vco.ttf',
    '700': 'http://fonts.gstatic.com/s/ptserif/v17/EJRSQgYoZZY2vCFuvAnt65qVXSr3pNNB.ttf',
    '700italic': 'http://fonts.gstatic.com/s/ptserif/v17/EJRQQgYoZZY2vCFuvAFT9gaQVy7VocNB6Iw.ttf'
  },
  selectedVariants: ['regular', '700'],
);
SColor kDefaultColor(Color? color) => SColor(
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
