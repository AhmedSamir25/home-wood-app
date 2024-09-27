import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/home_details/data/model/product_details_model.dart';

abstract class HomeDetailsRepo {
  Future<Either<Failure,ProductDetailsModel>> getProductDetails({required int productId});
}