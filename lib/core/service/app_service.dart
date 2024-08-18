import 'package:dio/dio.dart';
import 'package:homewood/core/security/app_keys.dart';
import 'package:homewood/core/security/base_url.dart';
import 'package:homewood/features/auth/data/model/auth_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<AuthModel> createUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        "$baseUrl/homewood/signup",
        data: {
          'name': userName,
          'email': email,
          'password': password,
        },
      );
return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      print('Error creating user: ${dioError.message}');
      rethrow;
    }
  }
}