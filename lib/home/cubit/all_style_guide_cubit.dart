import 'package:bloc/bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

import '../../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';

part 'all_style_guide_state.dart';

class AllStyleGuideCubit extends Cubit<StyleGuideState> {
  AllStyleGuideCubit({
    required this.selectedStyleGuideCubit,
    required this.styleGuideRepository,
  }) : super(StyleGuideState());

  final SelectedStyleGuideCubit selectedStyleGuideCubit;
  final StyleGuideRepository styleGuideRepository;

  Future<void> fetchAllStyleGuide() async {
    emit(state.copyWith(status: APIStatus.loading));
    final data = await styleGuideRepository.getAllStyleGuide();
    emit(
      data.fold(
        (l) => state.copyWith(status: APIStatus.failed, exception: l),
        (r) => state.copyWith(status: APIStatus.loaded, styleGuides: r),
      ),
    );
  }
}
