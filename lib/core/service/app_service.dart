import 'package:dio/dio.dart';
import 'package:homewood/core/constant/base_url.dart';
class ApiService {
  final Dio _dio;

  ApiService(this._dio);


  Future<Map<String, dynamic>> createUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    var response = await _dio.post('$buseUrl/homewood/signup', data: {
      'name': userName,
      'email': email,
      'password': password,
    });
    print(response.data);
    return response.data;
  }
}