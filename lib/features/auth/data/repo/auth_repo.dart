import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/auth/data/model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> createUser({
    required String name,
    required String email,
    required String password,
  });
}
