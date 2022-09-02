// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first, avoid_dynamic_calls, argument_type_not_assignable, implicit_dynamic_parameter
import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class StyleGuideModel {
  String? id;
  SColor? color;
  List<Typeface>? typeface;

  StyleGuideModel({this.id, this.color, this.typeface});

  StyleGuideModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    color = json['color'] != null ? SColor.fromJson(json['color']) : null;
    if (json['typeface'] != null) {
      typeface = <Typeface>[];
      json['typeface'].forEach((v) {
        typeface!.add(Typeface.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (typeface != null) {
      data['typeface'] = typeface!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  StyleGuideModel copyWith({
    String? id,
    SColor? color,
    List<Typeface>? typeface,
  }) {
    return StyleGuideModel(
      id: id ?? this.id,
      color: color ?? this.color,
      typeface: typeface ?? this.typeface,
    );
  }
}

class SColor {
  List<Color>? primary;
  List<Color>? secondary;
  List<Color>? semantic;
  List<Color>? neutral;

  SColor({this.primary, this.secondary, this.semantic, this.neutral});

  SColor.fromJson(Map<String, dynamic> json) {
    primary = (json['primary'] as List<String>).map(converHexToColor).toList();
    secondary = (json['secondary'] as List<String>).map(converHexToColor).toList();
    semantic = (json['semantic'] as List<String>).map(converHexToColor).toList();
    neutral = (json['neutral'] as List<String>).map(converHexToColor).toList();
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

class Typeface {
  String? type;
  String? family;
  double? fontSze;
  double? lineHeight;
  double? letterSpacing;
  String? update;
  String? created;

  Typeface({
    this.type,
    this.family,
    this.fontSze,
    this.lineHeight,
    this.letterSpacing,
    this.update,
    this.created,
  });

  Typeface.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    family = json['family'] as String;
    fontSze = json['fontSze'] as double;
    lineHeight = json['lineHeight'] as double;
    letterSpacing = json['letterSpacing'] as double;
    update = json['update'] as String;
    created = json['created'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['family'] = family;
    data['fontSze'] = fontSze;
    data['lineHeight'] = lineHeight;
    data['letterSpacing'] = letterSpacing;
    data['update'] = update;
    data['created'] = created;
    return data;
  }
}
