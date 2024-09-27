import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/core/utils/storage/save_userid.dart';
import 'package:homewood/features/home_details/data/model/product_details_model.dart';
import 'package:homewood/features/home_details/data/repo/home_details_repo.dart';

class HomeDetailsRepoImpl implements HomeDetailsRepo {
  final ApiService apiService;
  HomeDetailsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({required int productId}) async{
    try {
      ProductDetailsModel productDetailsModel = await apiService.getProductDetails(productId: productId, userId: SaveUserId().getUserId());
      return right(productDetailsModel); 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.type));
      }
      return left(ServerFailure(e.toString()));
    }
    }
}