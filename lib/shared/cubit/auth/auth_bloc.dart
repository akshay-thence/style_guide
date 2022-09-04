// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({UserRepository? repository})
      : _repository = repository ?? UserRepositoryImpl(),
        super(Uninitialized()) {
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_loginEvent);
    on<LoggedOut>(_logoutEvent);
  }

  final UserRepository _repository;

  FutureOr<void> _appStarted(AppStarted event, Emitter<AuthState> emit) async {
    final isSignedIn = await _repository.isSignedIn();
    if (isSignedIn) {
      final user = await _repository.getUser();
      AppLogger.s(user.toString());

      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  FutureOr<void> _loginEvent(LoggedIn event, Emitter<AuthState> emit) {
    emit(Authenticated());
  }

  FutureOr<void> _logoutEvent(LoggedOut event, Emitter<AuthState> emit) {
    _repository.signOut();
    emit(Unauthenticated());
  }
}
