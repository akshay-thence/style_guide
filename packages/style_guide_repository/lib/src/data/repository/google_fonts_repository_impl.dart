import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/app_errors.dart';
import '../../domain/google_fonts_repository.dart';
import '../model/google_font_model.dart';

class GoogleFontsLocalRepository extends GoogleFontsRepository {
  @override
  Future<Either<AppException, List<GoogleFontModel>>> getAllGoogleFonts() async {
    try {
      var jsonString = File('assets/google_fonts.json').readAsStringSync();
      final jsonData = json.decode(jsonString);
      return Right((jsonData['items'] as List).map((e) => GoogleFontModel.fromJson(e)).toList());
    } catch (e) {
      return Left(DataParsingException());
    }
  }
}
