import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../core/app_errors.dart';
import '../../domain/google_fonts_repository.dart';
import '../model/google_font_model.dart';

class GoogleFontsLocalRepository extends GoogleFontsRepository {
  @override
  Future<Either<AppException, List<GoogleFontModel>>> getAllGoogleFonts() async {
    try {
      var jsonString = await rootBundle.loadString('packages/style_guide_repository/assets/google_fonts.json');
      final jsonData = json.decode(jsonString);
      return Right(List<GoogleFontModel>.from((jsonData['items'])!.map((e) => GoogleFontModel.fromJson(e)).toList()));
    } catch (e) {
      return Left(DataParsingException());
    }
  }
}
