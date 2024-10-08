import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/service/service_lacetor.dart';
import 'package:homewood/core/utils/check_user_login.dart';
import 'package:homewood/features/auth/view/forget_password_view.dart';
import 'package:homewood/features/auth/view/widgets/check_token_view.dart';
import 'package:homewood/features/auth/view/widgets/reset_password_view.dart';
import 'package:homewood/features/home/view/home_view.dart';
import 'package:homewood/features/home_details/data/repo/home_details_repo_impl.dart';
import 'package:homewood/features/home_details/logic/cubit/product_details_cubit.dart';
import 'package:homewood/features/home_details/view/home_details_view.dart';

import '../../features/auth/view/signin_view.dart';

abstract class AppRouter {
  static const String home = "/";
  static const String signIn = "/signIn";
  static const String forgetPassword = "/forgetPassword";
  static const String checkToken = "/checkToken";
  static const String resetPasswordView = "/resetPasswordView";
  static const String homeView = "/homeView";
  static const String homeDetailsView = "/homeDetailsView";
  static final router = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const CheckUserLogin(),
    ),
    GoRoute(
      path: signIn,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: checkToken,
      builder: (context, state) => const CheckTokenView(),
    ),
    GoRoute(
      path: resetPasswordView,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: homeDetailsView,
      builder: (context, state) { 
       final int productId = state.extra as int;
       return BlocProvider(
        create: (context) => ProductDetailsCubit(getIt.get<HomeDetailsRepoImpl>())..getProductDetails(productId: productId),
        child: const HomeDetailsView(),
      );
      }
    ),
  ]);
}
