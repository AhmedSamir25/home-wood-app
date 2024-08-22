import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/circular_progress_indicator.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();

    final passwordController2 = TextEditingController();
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$!%_-])[A-Za-z\d@#$]{8,}$',
    );
    final authCubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.signIn);
        }
        if (state is FieldResetPassword) {
          showSnackBar(context, state.message, AppColors.redColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    AuthTextField(
                        controller: passwordController,
                        labelText: "Password",
                        type: TextInputType.text,
                        suffixIcon: const Icon(Icons.password),
                        obscureText: true),
                    SizedBox(
                      height: 15.h,
                    ),
                    AuthTextField(
                        controller: passwordController2,
                        labelText: "Confirm Password",
                        type: TextInputType.text,
                        suffixIcon: const Icon(Icons.password),
                        obscureText: true),
                    SizedBox(
                      height: 15.h,
                    ),
                    AuthButton(
                        onPressed: () {
                          if (passwordController.text.isEmpty &&
                              passwordController2.text.isEmpty) {
                            showSnackBar(context, ConfingLang.localizations['pleaseFealAll'], AppColors.redColor);
                            return;
                          }

                          if (passwordController.text !=
                              passwordController2.text) {
                            showSnackBar(
                                context, ConfingLang.localizations['mismatchedPasswords'], AppColors.redColor);
                            return;
                          }
                          if (!passwordRegExp
                              .hasMatch(passwordController.text)) {
                            showSnackBar(
                                context, ConfingLang.localizations['validPassword'], AppColors.redColor);
                            return;
                          }

                          context.read<AuthCubit>().resetPassword(
                              email: authCubit.email,
                              password: passwordController.text,
                              token: authCubit.tokenField);
                        },
                        buttonText: ConfingLang.localizations['reset'])
                  ],
                ),
                if (state is AuthLoading)
                  customCircularProgressIndicator(context: context)
              ],
            ),
          ),
        );
      },
    );
  }
}