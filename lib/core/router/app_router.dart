import 'package:go_router/go_router.dart';
import 'package:homewood/features/auth/view/signup_view.dart';

abstract class AppRouter {
  static const String home = "/";
  static final router = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const SignupView(),
    ),
  ]);
}
