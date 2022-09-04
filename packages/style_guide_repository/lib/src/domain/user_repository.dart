import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/app_errors.dart';

abstract class UserRepository {
  Future<Either<LogInWithGoogleFailure, User>> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<User> getUser();
}
