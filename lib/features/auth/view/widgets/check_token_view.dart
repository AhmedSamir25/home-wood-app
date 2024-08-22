import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/circular_progress_indicator.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';

class CheckTokenView extends StatelessWidget {
  const CheckTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    String tokenCode = '';
    final email = context.read<AuthCubit>().email;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CheckTokenSuccess) {
          GoRouter.of(context).push(
            AppRouter.resetPasswordView,
          );
        }
        if (state is FieldCheckToken) {
          showSnackBar(context, state.message, AppColors.redColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: AppColors.amberColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        tokenCode = code;
                      },
                      onSubmit: (String code) {
                        tokenCode = code; 
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthButton(
                        onPressed: () {
                          if (tokenCode.length == 6) {
                            int codeToken = int.parse(tokenCode);
                            context.read<AuthCubit>().checkToken(
                                email: email, token: codeToken);
                            context.read<AuthCubit>().tokenField = codeToken;
                          } else {
                            showSnackBar(context, ConfingLang.localizations['invalidTokenLength'], AppColors.redColor);
                          }
                        },
                        buttonText: ConfingLang.localizations['verifyToken']),
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
