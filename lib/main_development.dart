import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:thence_style_guide/bootstrap.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GoogleFontsRepository googleFontsRepository = GoogleFontsLocalRepository();
  final StyleGuideRepository styleGuideRepository = StyleGuideRepositoryImpl();
  await bootstrap(
    googleFontsRepository: googleFontsRepository,
    styleGuideRepository: styleGuideRepository,
  );
}
