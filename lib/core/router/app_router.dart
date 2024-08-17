import 'package:go_router/go_router.dart';
import 'package:homewood/features/auth/view/forget_password_view.dart';
import 'package:homewood/features/auth/view/signup_view.dart';
import 'package:homewood/features/auth/view/widgets/check_token_view.dart';
import 'package:homewood/features/auth/view/widgets/reset_password_view.dart';

import '../../features/auth/view/signin_view.dart';

abstract class AppRouter {
  static const String home = "/";
  static const String signIn = "/signIn";
  static const String forgetPassword = "/forgetPassword";
  static const String checkToken = "/checkToken";
  static const String resetPasswordView = "/resetPasswordView";
  static final router = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(path: signIn,
    builder: (context, state) => const SignInView(),
    ),
    GoRoute(path: forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(path: checkToken,
    builder: (context, state) => const CheckTokenView(),
    ),
    GoRoute(path: resetPasswordView,
    builder:  (context, state) => const ResetPasswordView(),
    )
  ]);
}
