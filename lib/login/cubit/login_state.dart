// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedSuccess extends LoginState {}

class LoggedFailed extends LoginState {
  LoggedFailed({
    required this.exception,
  });

  final LogInWithGoogleFailure exception;
}

class Loading extends LoginState {}
