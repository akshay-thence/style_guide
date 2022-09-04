// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

import '../../shared/model/selected_font.dart';

part 'import_fonts_state.dart';

class ImportFontsCubit extends Cubit<ImportFontsState> {
  ImportFontsCubit(this.googleFontsRepository) : super(ImportFontsState());

  final GoogleFontsRepository googleFontsRepository;

  // initially fetch all google fonts
  Future<void> fetchAllGoogleFonts() async {
    // it font is already fetched or status is loading [return]
    if (state.status == APIStatus.loading || state.allGoogleFonts.isNotEmpty) return;

    emit(state.copyWith(status: APIStatus.loading));
    final res = await googleFontsRepository.getAllGoogleFonts();

    emit(
      res.fold(
        (l) => state.copyWith(status: APIStatus.failed),
        (r) => state.copyWith(status: APIStatus.loaded, allGoogleFonts: r),
      ),
    );
  }

  /// search for a font by font name in the fetched font list
  /// takes String as key
  void searchGoogleFont(String key) {
    final searchSuggestion = <GoogleFontModel>[];

    for (final i in state.allGoogleFonts) {
      if (i.family?.toLowerCase().contains(key.toLowerCase()) ?? false) {
        searchSuggestion.add(i);
      }
    }

    emit(state.copyWith(searchResult: searchSuggestion));
  }

  /// emit state when user select a font
  /// font can be primary or secondary
  void selectFont({required GoogleFontModel selectedFont, required bool isPrimary}) {
    final font = SelectedFontModel(
      fontStyle: selectedFont.family!,
      variants: selectedFont.variants!,
      files: selectedFont.files!,
    );

    if (isPrimary) {
      emit(state.copyWith(primaryFont: font));
    } else {
      emit(state.copyWith(secondaryFont: font));
    }
  }
}
// {
//   FontWeight.w100: 'Thin',
//   FontWeight.w200: 'ExtraLight',
//   FontWeight.w300: 'Light',
//   FontWeight.w400: 'Regular',
//   FontWeight.w500: 'Medium',
//   FontWeight.w600: 'SemiBold',
//   FontWeight.w700: 'Bold',
//   FontWeight.w800: 'ExtraBold',
//   FontWeight.w900: 'Black',
// }
