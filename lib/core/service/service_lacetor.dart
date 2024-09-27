import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';
import 'package:homewood/features/home/data/repo/home_repo_impl.dart';
import 'package:homewood/features/home_details/data/repo/home_details_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
   getIt.registerSingleton<ApiService>(ApiService(Dio()));
     getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
   getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt<ApiService>()));
   getIt.registerSingleton<HomeDetailsRepoImpl>(HomeDetailsRepoImpl(apiService: getIt<ApiService>()));
}
