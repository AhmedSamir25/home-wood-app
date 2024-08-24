import 'package:dartz/dartz.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/features/home/data/model/banner_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BannerModel>> getBanner();
}