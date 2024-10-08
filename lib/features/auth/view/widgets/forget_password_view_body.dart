import 'package:email_validator/email_validator.dart';
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

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendTokenSuccess) {
          GoRouter.of(context).push(AppRouter.checkToken);
        }
        if (state is FieldSendToken) {
          showSnackBar(context, state.message, AppColors.amberColor);
        }
        if (state is AuthLoading) {
          customCircularProgressIndicator(context: context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  AuthTextField(
                      controller: emailController,
                      labelText: "Email",
                      type: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false),
                  SizedBox(
                    height: 20.h,
                  ),
                  AuthButton(
                      onPressed: () {
                        if (!EmailValidator.validate(emailController.text)) {
                          showSnackBar(context, ConfingLang.localizations['validEmail'], AppColors.redColor);
                          return;
                        }else{
                          context.read<AuthCubit>().email = emailController.text;
                          context.read<AuthCubit>().forgetPassword(email: emailController.text);
                          
                        }
                      },
                      buttonText: ConfingLang.localizations['sendToken'])
                ],
              ),
              if (state is AuthLoading)
                customCircularProgressIndicator(context: context)
            ],
          ),
        );
      },
    );
  }
}
