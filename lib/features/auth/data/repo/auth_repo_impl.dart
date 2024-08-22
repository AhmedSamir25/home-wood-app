import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/features/auth/data/model/auth_model.dart';
import 'package:homewood/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthModel>> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.createUser(
        userName: name,
        email: email,
        password: password,
      );
      return Right(response);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, AuthModel>> forgetPassword({required String email}) async {
    try {
      final response = await apiService.forgetPassword(email: email);
      return Right(response);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, AuthModel>> loginUser({required String email, required String password}) async {
    try {
      final response = await apiService.loginUser(email: email, password: password);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
  

  @override
  Future<Either<Failure, AuthModel>> resetPassword({
    required String email,
    required int token,
    required String password,
  }) async {
    try {
      final response = await apiService.resetPassword(email: email, token: token, password: password);
      return Right(response);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, AuthModel>> checkToken({
    required String email,
    required int token,
  }) async {
    try {
      final response = await apiService.checkToken(email: email, token: token);
      return Right(response);
    }catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}