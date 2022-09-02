import 'package:dartz/dartz.dart';
import 'package:style_guide_repository/src/core/app_errors.dart';

import '../data/model/google_font_model.dart';

abstract class GoogleFontsRepository {
  Future<Either<AppException, List<GoogleFontModel>>> getAllGoogleFonts();
}
