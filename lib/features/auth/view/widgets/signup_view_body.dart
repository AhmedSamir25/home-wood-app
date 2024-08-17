import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/signup_vaild_fuction.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';
import 'package:homewood/features/auth/view/widgets/have_account_ornot.dart';
import 'package:homewood/features/auth/view/widgets/head_body_text.dart';
import 'package:homewood/features/auth/view/widgets/password_text_field.dart';
import 'package:homewood/features/auth/view/widgets/row_valid_password.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasPasswordLength = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    final password = passwordController.text;
    setState(() {
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      hasLowerCase = password.contains(RegExp(r'[a-z]'));
      hasPasswordLength = password.length == 8 || password.length > 8;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        children: [
          const HeadBodyText(
            headText: "Sign up",
            bodyText: "Join us to find the best \n     types of furniture",
          ),
          SizedBox(
            height: 26.h,
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
          SizedBox(height: 12.h,),
          PasswordTextField(controller: passwordController),
          SizedBox(height: 12.h,),
          RowValidPassword(numberAdd: hasNumber,specialChar: hasSpecialChar,
            lowChar:hasLowerCase ,upChar:hasUpperCase,passwordLength: hasPasswordLength,),
          SizedBox(height: 15.h,),
          AuthButton(onPressed: () {
            signupAndValidFunction(context: context,name: nameController.text,
              email: emailController.text,
              password: passwordController.text, onPerasd: (){},
            );},
              buttonText: "Sign Up"),
          SizedBox(
            height: 17.h,
          ),
      HaveAccountOrNot(onPressed: (){
            GoRouter.of(context).push(AppRouter.signIn);
          }, text: "do you have account?",textButton: "Sign in",),
        ],
      ),
    );
  }
}
