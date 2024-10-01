import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/favorite/data/model/favorite_model.dart';
import 'package:homewood/features/home/data/model/product_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, ProductModel>> getProductsFromFavorite();
  Future<Either<Failure, FavoriteModel>> addProductsToFavorite({required int productId});
}