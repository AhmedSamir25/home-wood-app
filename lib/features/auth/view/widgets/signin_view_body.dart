import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';
import 'package:homewood/core/utils/widgets/flutter_toast.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';
import 'package:homewood/features/auth/view/widgets/have_account_ornot.dart';
import 'package:homewood/features/auth/view/widgets/head_body_text.dart';
import 'package:homewood/features/auth/view/widgets/password_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginUserSuccess) {
          flutterToast(
              backgroundColor: AppColors.amberColor,
              textColor: AppColors.blackColor,
              textToast: ConfingLang.localizations['welcomeback']);
          GoRouter.of(context).pushReplacement(AppRouter.homeView);
        }
        if (state is FieldLoginUser) {
          showSnackBar(context, state.message, AppColors.redColor);
        }
      },
      builder: (context, state) {
        final RegExp passwordRegExp = RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$])[A-Za-z\d@#$]{8,}$',
        );
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ListView(
                children: [
                  HeadBodyText(
                    headText: ConfingLang.localizations['signIn'],
                    bodyText: ConfingLang.localizations['welcomeback'],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AuthTextField(
                    controller: emailController,
                    labelText: "Email",
                    suffixIcon: const Icon(Icons.email),
                    obscureText: false,
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  PasswordTextField(controller: passwordController),
                  SizedBox(
                    height: 17.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.forgetPassword);
                        },
                        child: Text(ConfingLang.localizations['forgetPassword'],
                            style: StyleText.textStyle14),
                      )),
                  HaveAccountOrNot(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    text: ConfingLang.localizations['donthaveaccount'],
                    textButton: ConfingLang.localizations['signUp'],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthButton(
                      onPressed: () {
                        if (emailController.text.isEmpty &&
                            passwordController.text.isEmpty) {
                          showSnackBar(context, ConfingLang.localizations["pleaseFealAll"],
                              AppColors.redColor);
                          return;
                        }
                        if (!EmailValidator.validate(emailController.text)) {
                          showSnackBar(context, ConfingLang.localizations['validEmail'], AppColors.redColor);
                          return;
                        }
                        if (!passwordRegExp.hasMatch(passwordController.text)) {
                          showSnackBar(
                              context, ConfingLang.localizations['validPassword'], AppColors.redColor);
                          return;
                        }
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          context.read<AuthCubit>().loginUser(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      buttonText: ConfingLang.localizations['signIn'])
                ],
              ),
            ),
            if (state is AuthLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.amberColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
