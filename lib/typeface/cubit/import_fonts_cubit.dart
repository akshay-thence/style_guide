import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'import_fonts_state.dart';

class ImportFontsCubit extends Cubit<ImportFontsState> {
  ImportFontsCubit() : super(ImportFontsInitial());
}
