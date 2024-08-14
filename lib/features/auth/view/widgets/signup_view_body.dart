import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';
import 'package:homewood/features/auth/view/widgets/have_account_ornot.dart';
import 'package:homewood/features/auth/view/widgets/head_body_text.dart';
import 'package:homewood/features/auth/view/widgets/password_text_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
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
              suffixIcon: const Icon(Icons.person),
              obscureText: false,
          ),
          SizedBox(
            height: 12.h,
          ),
          AuthTextField(
              controller: emailController,
              labelText: "Email",
              suffixIcon: const Icon(Icons.email),
              obscureText: false,
          ),
          SizedBox(
            height: 12.h,
          ),
          PasswordTextField(controller: passwordController),
          SizedBox(
            height: 17.h,
          ),
          HaveAccountOrNot(onPressed: (){}, text: "do you have account?",textButton: "Sign in",),
          SizedBox(height: 10.h,),
          AuthButton(onPressed: () {}, buttonText: "Sign Up")
        ],
      ),
    );
  }
}
