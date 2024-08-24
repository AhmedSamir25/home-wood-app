import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homewood/core/error/failure.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/features/home/data/model/banner_model.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BannerModel>> getBanner() async {
    try {
      BannerModel bannerModel = await apiService.getBanners();
      return right(bannerModel); 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.type));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
