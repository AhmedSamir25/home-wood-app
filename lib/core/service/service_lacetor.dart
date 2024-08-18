import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:homewood/core/service/app_service.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
   getIt.registerSingleton<ApiService>(ApiService(Dio()));
}