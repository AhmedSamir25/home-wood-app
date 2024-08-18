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

      // تحويل الاستجابة إلى AuthModel
      AuthModel user = AuthModel.fromJson(response as Map<String, dynamic>);

      return Right(user);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
