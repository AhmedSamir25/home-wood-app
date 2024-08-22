import 'package:flutter/material.dart';
import 'package:homewood/features/auth/view/widgets/signin_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
