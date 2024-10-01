import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/core/utils/storage/save_userid.dart';
import 'package:homewood/features/favorite/data/model/favorite_model.dart';
import 'package:homewood/features/favorite/data/repo/favorite_repo.dart';
import 'package:homewood/features/home/data/model/product_model.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final ApiService apiService;
  FavoriteRepoImpl(this.apiService);
  @override
  Future<Either<Failure, FavoriteModel>> addProductsToFavorite({required int productId}) async{
    try {
      FavoriteModel favoriteModel = await apiService.addProductsToFavorite(productId: productId, userId: SaveUserId().getUserId());
      return right(favoriteModel); 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.type));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductsFromFavorite() async{
    try {
    ProductModel productModel = await apiService.getFavoriteProducts(userId: SaveUserId().getUserId(),);
      return right(productModel); 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.type));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
}