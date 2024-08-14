import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';
import 'package:homewood/features/auth/view/widgets/head_body_text.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          const HeadBodyText(
            headText: "Sign up",
            bodyText: "create your account",
          ),
          SizedBox(
            height: 30.h,
          ),
          AuthTextField(
              controller: nameController,
              labelText: "Name",
              suffixIcon: const Icon(Icons.person)),
          SizedBox(
            height: 12.h,
          ),
          AuthTextField(
              controller: emailController,
              labelText: "Email",
              suffixIcon: const Icon(Icons.email)),
          SizedBox(
            height: 12.h,
          ),
          AuthTextField(
              controller: passwordController,
              labelText: "Password",
              suffixIcon: const Icon(Icons.password)),
          SizedBox(
            height: 17.h,
          ),
          AuthButton(onPressed: () {}, buttonText: "Button Text")
        ],
      ),
    );
  }
}
