import 'package:dartz/dartz.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

abstract class StyleGuideRepository {
  Future<Either<AppException, List>> getAllStyleGuide();
  Future<Either<AppException, bool>> createStyleGuide();
  Future<Either<AppException, bool>> updateStyleGuide();
  Future<Either<AppException, bool>> deleteStyleGuide();
}
