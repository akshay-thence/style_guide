// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'import_fonts_cubit.dart';

class ImportFontsState {
  ImportFontsState({
    this.allGoogleFonts = const [],
    this.searchResult = const [],
    this.selectedFont = const [],
    this.status = APIStatus.initial,
    this.primaryFont,
    this.secondaryFont,
  });

  ImportFontsState copyWith({
    List<GoogleFontModel>? allGoogleFonts,
    List<GoogleFontModel>? searchResult,
    List<GoogleFontModel>? selectedFont,
    APIStatus? status,
    SelectedFontModel? primaryFont,
    SelectedFontModel? secondaryFont,
    int? selectedFontIndex,
  }) {
    return ImportFontsState(
      allGoogleFonts: allGoogleFonts ?? this.allGoogleFonts,
      searchResult: searchResult ?? this.searchResult,
      selectedFont: selectedFont ?? this.selectedFont,
      status: status ?? this.status,
      primaryFont: primaryFont ?? this.primaryFont,
      secondaryFont: secondaryFont ?? this.secondaryFont,
    );
  }

  final List<GoogleFontModel> allGoogleFonts;
  final List<GoogleFontModel> searchResult;
  final List<GoogleFontModel> selectedFont;
  final APIStatus status;
  final SelectedFontModel? primaryFont;
  final SelectedFontModel? secondaryFont;
}
