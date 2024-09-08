import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/home/data/model/banner_model.dart';
import 'package:homewood/features/home/data/model/categories_model.dart';
import 'package:homewood/features/home/data/model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BannerModel>> getBanner();
  Future<Either<Failure, CategoriesModel>> getCategories();
  Future<Either<Failure, ProductModel>> getProducts({required int pageNumber});
  Future<Either<Failure, ProductModel>> getProductsCategories({required int categoreyId, required int pageNumber});
}