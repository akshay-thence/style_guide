part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {
  Authenticated();
}

class Unauthenticated extends AuthState {}
