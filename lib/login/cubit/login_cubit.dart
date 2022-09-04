import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:style_guide_repository/style_guide_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({UserRepository? repository})
      : _repository = repository ?? UserRepositoryImpl(),
        super(LoginInitial());

  final UserRepository _repository;

  Future<void> sigInWithGoogle() async {
    final res = await _repository.signInWithGoogle();
    emit(
      res.fold(
        (l) => LoggedFailed(exception: l),
        (r) => LoggedSuccess(),
      ),
    );
  }
}
