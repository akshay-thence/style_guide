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

  void generateDefaultFont({bool isPrimaryFont = true}) {
    late SelectedFontModel font;
    if (isPrimaryFont) {
      font = SelectedFontModel(
        fontStyle: 'Sora',
        variants: ['100', '200', '300', 'regular', '500', '600', '700', '800'],
        files: {
          '100': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdSn3-KIwNhBti0.ttf',
          '200': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSfSnn-KIwNhBti0.ttf',
          '300': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmScMnn-KIwNhBti0.ttf',
          'regular': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdSnn-KIwNhBti0.ttf',
          '500': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSdgnn-KIwNhBti0.ttf',
          '600': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSeMmX-KIwNhBti0.ttf',
          '700': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSe1mX-KIwNhBti0.ttf',
          '800': 'http://fonts.gstatic.com/s/sora/v11/xMQOuFFYT72X5wkB_18qmnndmSfSmX-KIwNhBti0.ttf'
        },
        selectedVariants: ['regular', '500', '700'],
      );
    } else {
      font = SelectedFontModel(
        fontStyle: 'PT Serif',
        variants: ['regular', 'italic', '700', '700italic'],
        files: {
          'regular': 'http://fonts.gstatic.com/s/ptserif/v17/EJRVQgYoZZY2vCFuvDFRxL6ddjb-.ttf',
          'italic': 'http://fonts.gstatic.com/s/ptserif/v17/EJRTQgYoZZY2vCFuvAFTzrq_cyb-vco.ttf',
          '700': 'http://fonts.gstatic.com/s/ptserif/v17/EJRSQgYoZZY2vCFuvAnt65qVXSr3pNNB.ttf',
          '700italic': 'http://fonts.gstatic.com/s/ptserif/v17/EJRQQgYoZZY2vCFuvAFT9gaQVy7VocNB6Iw.ttf'
        },
        selectedVariants: ['regular', '700'],
      );
    }

    if (isPrimaryFont) {
      emit(state.copyWith(primaryFont: font));
    } else {
      emit(state.copyWith(secondaryFont: font));
    }
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

  void selectFontWeight({required bool isPrimaryFont, required String fontWeight}) {
    var tempFontWeights = <String>[];

    if (isPrimaryFont) {
      tempFontWeights = state.primaryFont!.selectedVariants;
    } else {
      tempFontWeights = state.secondaryFont!.selectedVariants;
    }

    // add or remove fonts
    if (tempFontWeights.contains(fontWeight)) {
      tempFontWeights.remove(fontWeight);
    } else {
      tempFontWeights = [fontWeight, ...tempFontWeights];
    }

    // emit state
    if (isPrimaryFont) {
      emit(
        state.copyWith(
          primaryFont: state.primaryFont!.copyWith(selectedVariants: tempFontWeights),
        ),
      );
    } else {
      emit(
        state.copyWith(
          secondaryFont: state.secondaryFont!.copyWith(selectedVariants: tempFontWeights),
        ),
      );
    }
  }
}
