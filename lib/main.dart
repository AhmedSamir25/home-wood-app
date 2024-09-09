import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/utils/storage/save_userid.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/localization/cubit/localization_cubit_cubit.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/service/service_lacetor.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/home/data/repo/home_repo_impl.dart';
import 'package:homewood/features/home/logic/banner_cubit/banner_cubit.dart';
import 'package:homewood/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:homewood/features/home/logic/products_cubit/products_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await ConfingLang.loadlanguage(ConfingLang.currentLanguage);
  await SaveUserId.cacheInitialization();
  runApp(const HomeWoodApp());
}

class HomeWoodApp extends StatelessWidget {
  const HomeWoodApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => LocalizationCubitCubit()..loadInitialLanguage(),),
        BlocProvider(create: (context) => BannerCubit( getIt.get<HomeRepoImpl>(),)..fetchBanners(),),
        BlocProvider(create: (context) => CategoriesCubit(getIt.get<HomeRepoImpl>())..fetchCategories(),),
        BlocProvider(create: (context)=> ProductsCubit(getIt.get<HomeRepoImpl>())..fetchProducts()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              title: 'Home Wood',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.amberColor),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            );
          }),
    );
  }
}
