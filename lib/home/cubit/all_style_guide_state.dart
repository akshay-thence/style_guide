// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_style_guide_cubit.dart';

class StyleGuideState {
  StyleGuideState({
    this.styleGuides = const [],
    this.status = APIStatus.initial,
    this.exception,
  });

  StyleGuideState copyWith({
    List<StyleGuideModel>? styleGuides,
    APIStatus? status,
    AppException? exception,
  }) {
    return StyleGuideState(
      styleGuides: styleGuides ?? this.styleGuides,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  final List<StyleGuideModel> styleGuides;
  final APIStatus status;
  final AppException? exception;
}
