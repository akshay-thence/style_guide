import 'package:flutter/material.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:thence_style_guide/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final GoogleFontsRepository googleFontsRepository = GoogleFontsLocalRepository();
  bootstrap(googleFontsRepository: googleFontsRepository);
}
