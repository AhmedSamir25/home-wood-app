import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:homewood/core/service/app_service.dart';
import 'package:homewood/features/auth/data/repo/auth_repo.dart';
import 'package:homewood/features/auth/data/repo/auth_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
   getIt.registerSingleton<ApiService>(ApiService(Dio()));
   getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<ApiService>()));

}