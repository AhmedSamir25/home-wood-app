import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/circular_progress_indicator.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class CheckTokenView extends StatelessWidget {
  const CheckTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenController = TextEditingController();
    final email = context.read<AuthCubit>().email;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
      if(state is CheckTokenSuccess){
        GoRouter.of(context).push(AppRouter.resetPasswordView,);
      }
      if(state is FieldCheckToken){
        showSnackBar(context, state.message, AppColors.redColor);
      }
      if(state is AuthLoading){
        customCircularProgressIndicator(context:context);
      }
        },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: ListView(
            children: [
              SizedBox(height: 100.h,),
              AuthTextField(controller: tokenController,
                  labelText: "Token", suffixIcon: const Icon(Icons.email),
                  obscureText: false),
              SizedBox(height: 20.h,),
              AuthButton(onPressed: () {
                if (tokenController.text.length == 6) {
                  context.read<AuthCubit>().checkToken(email: email, token: int.parse(tokenController.text));
                  context.read<AuthCubit>().tokenField = int.parse(tokenController.text);

                } else {
                  showSnackBar(context, "messagexx", AppColors.redColor);
                }
              },
                  buttonText: "verify token")
            ],
          ),
        ),
      ),
    );
  }
}
