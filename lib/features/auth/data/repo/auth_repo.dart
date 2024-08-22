import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/auth/data/model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> createUser({
    required String name,required String email,required String password,
  });
  Future<Either<Failure , AuthModel>> loginUser({
    required String email, required String password
  });
  Future<Either<Failure, AuthModel>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, AuthModel>> checkToken({
    required String email, required int token,
});
 Future<Either<Failure , AuthModel>> resetPassword({
    required String email, required int token, required String password,
});
}
