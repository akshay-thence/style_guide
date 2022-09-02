import 'package:flutter_test/flutter_test.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

void main() {
  testWidgets('Load google fonts from assets ...', (tester) async {
    final GoogleFontsRepository googleFontsRepository = GoogleFontsLocalRepository();
    final result = await googleFontsRepository.getAllGoogleFonts();
    expect(result.isRight(), true);
  });
}
