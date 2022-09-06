import 'package:flutter/material.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:thence_style_guide/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GoogleFontsRepository googleFontsRepository = GoogleFontsLocalRepository();
  final StyleGuideRepository styleGuideRepository = StyleGuideRepositoryImpl();
  await bootstrap(
    googleFontsRepository: googleFontsRepository,
    styleGuideRepository: styleGuideRepository,
  );
}
