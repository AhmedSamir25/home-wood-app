import 'package:dio/dio.dart';
import 'package:homewood/core/security/app_keys.dart';
import 'package:homewood/features/auth/data/model/auth_model.dart';
import 'package:homewood/features/home/data/model/banner_model.dart';
import 'package:homewood/features/home/data/model/categories_model.dart';
import 'package:homewood/features/home/data/model/product_model.dart';
import 'package:homewood/features/home_details/data/model/product_details_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<AuthModel> createUser({
    required String userName,required String email,required String password,
  }) async {
      var response = await _dio.post("$baseUrl/homewood/signup",data: {
          'name': userName,'email': email,'password': password,
        },
      );
    return AuthModel.fromJson(response.data);
  }
  Future<AuthModel> loginUser({
    required String email,required String password,
  }) async {
    var response = await _dio.get("$baseUrl/homewood/login",data: {
      'email': email,'password': password,
    },
    );
    return AuthModel.fromJson(response.data);
  }
  Future<AuthModel> forgetPassword({
    required String email,
  }) async {
    var response = await _dio.post("$baseUrl/homewood/forgetpassword",data: {
      'email': email,
    },
    );
    return AuthModel.fromJson(response.data);
  }
  // check token
  Future<AuthModel> checkToken({required String email, required int token})async{
    var response = await _dio.get("$baseUrl/homewood/checktoken",data: {
      'email' : email, 'token' : token,
    });
    return AuthModel.fromJson(response.data);
  }
  // reset password
  Future<AuthModel> resetPassword({
    required int token,required String email,required String password,
  }) async {
    var response = await _dio.put("$baseUrl/homewood/resetpassword",data: {
      'token': token,'email': email,'password': password,
    },
    );
    return AuthModel.fromJson(response.data);
  }

  Future<BannerModel> getBanners() async {
    var response = await _dio.get("$baseUrl/homewood/banner",
    );
    return BannerModel.fromJson(response.data);
  }

    Future<BannerModel> addBanner({required String imageBanner}) async {
    var response = await _dio.post("$baseUrl/homewood/banner",data: {
        "banner_image" : imageBanner
      }
    );
    return BannerModel.fromJson(response.data);
  }

  Future<BannerModel> deleteBanner({required int bannerId}) async {
    var response = await _dio.delete("$baseUrl/homewood/banner$bannerId",
    );
    return BannerModel.fromJson(response.data);
  }
  Future<CategoriesModel> getCategories() async{
    var response = await _dio.get("$baseUrl/homewood/categories");
    return CategoriesModel.fromJson(response.data);
  }
  Future<ProductModel> getProducts({required int pageNumber}) async{
    var response = await _dio.get("$baseUrl/homewood/products=$pageNumber");
    return ProductModel.fromJson(response.data);
  }
  Future<ProductModel> getProductsByCategories({required int categoryId, required int pageNumber}) async{
    var response = await _dio.get("$baseUrl/homewood/products/category=$categoryId/page_id=$pageNumber");
    return ProductModel.fromJson(response.data);
  }
  Future<ProductDetailsModel> getProductDetails({required int productId}) async{
    var response = await _dio.get("$baseUrl/homewood/product/details=$productId");
    return ProductDetailsModel.fromJson(response.data);
  }
}