// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first, avoid_dynamic_calls, argument_type_not_assignable, implicit_dynamic_parameter
import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class SColor {
  List<Color>? primary;
  List<Color>? secondary;
  List<Color>? semantic;
  List<Color>? neutral;

  SColor({this.primary, this.secondary, this.semantic, this.neutral});

  SColor.fromJson(Map<String, dynamic> json) {
    primary = (json['primary'] as List<String>).map(convertHexToColor).toList();
    secondary = (json['secondary'] as List<String>).map(convertHexToColor).toList();
    semantic = (json['semantic'] as List<String>).map(convertHexToColor).toList();
    neutral = (json['neutral'] as List<String>).map(convertHexToColor).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    data['semantic'] = semantic;
    data['neutral'] = neutral;
    return data;
  }
}
