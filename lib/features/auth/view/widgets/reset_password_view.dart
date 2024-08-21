import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/functions/valid_function.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/circular_progress_indicator.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasPasswordLength = false;
  bool hasMatch = false;
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

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
      hasMatch = password == passwordController2.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is ResetPasswordSuccess){
          GoRouter.of(context).pushReplacement(AppRouter.home);
        }
        if(state is FieldResetPassword){
          showSnackBar(context, state.message, AppColors.redColor);
        }
      },
      builder: (context, state) {
        return  Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: 70.h,),
                  AuthTextField(controller: passwordController,
                      labelText: "Password",
                      suffixIcon: const Icon(Icons.password),
                      obscureText: true),
                  SizedBox(height: 15.h,),
                  AuthTextField(controller: passwordController2,
                      labelText: "Confirm Password",
                      suffixIcon: const Icon(Icons.password),
                      obscureText: true),
                  SizedBox(height: 15.h,),
                  AuthButton(
                      onPressed: () {
                        if (hasNumber && hasPasswordLength && hasUpperCase &&
                            hasLowerCase && hasSpecialChar == true) {
                          context.read<AuthCubit>().resetPassword(
                              email: authCubit.email,
                              password: passwordController.text,
                              token: authCubit.tokenField);
                        }
                        validFunction(
                          context: context,
                          email: authCubit.email,
                          password: passwordController.text,
                        );
                      },
                      buttonText: "Reset")
                ],
              ),
              if(state is AuthLoading)
                 customCircularProgressIndicator(context:context)
            ],
          ),
        ),
      );
      },
    );
  }
}
