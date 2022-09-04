// ignore_for_file: prefer_const_constructors, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:style_guide_repository/src/core/app_errors.dart';
import 'package:style_guide_repository/src/domain/style_guide_repository.dart';

class StyleGuideRepositoryImpl extends StyleGuideRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  StyleGuideRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? firebaseStorage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  @override
  Future<Either<AppException, bool>> createStyleGuide() async {
    try {
      return Right(true);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> deleteStyleGuide() async {
    try {
      return const Right(true);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, List>> getAllStyleGuide() async {
    try {
      return Right([]);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> updateStyleGuide() async {
    try {
      return Right(true);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
