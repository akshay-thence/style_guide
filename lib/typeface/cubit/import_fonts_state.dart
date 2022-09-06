// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'import_fonts_cubit.dart';

class ImportFontsState {
  ImportFontsState({
    this.allGoogleFonts = const [],
    this.searchResult = const [],
    this.selectedFont = const [],
    this.status = APIStatus.initial,
  });

  ImportFontsState copyWith({
    List<GoogleFontModel>? allGoogleFonts,
    List<GoogleFontModel>? searchResult,
    List<GoogleFontModel>? selectedFont,
    APIStatus? status,
    int? selectedFontIndex,
  }) {
    return ImportFontsState(
      allGoogleFonts: allGoogleFonts ?? this.allGoogleFonts,
      searchResult: searchResult ?? this.searchResult,
      selectedFont: selectedFont ?? this.selectedFont,
      status: status ?? this.status,
    );
  }

  final List<GoogleFontModel> allGoogleFonts;
  final List<GoogleFontModel> searchResult;
  final List<GoogleFontModel> selectedFont;
  final APIStatus status;
}
