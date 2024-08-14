import 'package:flutter/material.dart';
import 'package:homewood/features/auth/view/widgets/head_body_text.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeadBodyText(),
      ],
    );
  }
}
