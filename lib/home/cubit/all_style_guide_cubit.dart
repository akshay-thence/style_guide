import 'package:bloc/bloc.dart';

import '../../../shared/cubit/selected_style_guide/selected_style_guide_cubit.dart';
import '../../../shared/model/style_guide_model.dart';

part 'all_style_guide_state.dart';

class AllStyleGuideCubit extends Cubit<StyleGuideState> {
  AllStyleGuideCubit({required this.selectedStyleGuideCubit}) : super(StyleGuideState());

  SelectedStyleGuideCubit selectedStyleGuideCubit;
}