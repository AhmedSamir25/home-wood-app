import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/functions/signup_vaild_fuction.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/flutter_toast.dart';
import 'package:homewood/features/auth/logic/auth_cubit.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is CreateUserSuccess){
            flutterToast(backgroundColor: AppColors.amberColor,
                textColor: AppColors.blackColor, textToast: ConfingLang.localizations['successfullycreated']);
            GoRouter.of(context).pushReplacement(AppRouter.homeView);
          }
          if(state is FieldCreateUser){
            showSnackBar(context, state.message, AppColors.redColor);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ListView(
                  children: [
                    HeadBodyText(
                      headText: ConfingLang.localizations['signUp'],
                      bodyText: ConfingLang.localizations['bodySignUp'],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    AuthTextField(
                      controller: nameController,
                      labelText: "Name",
                      type: TextInputType.name,
                      suffixIcon: const Icon(Icons.person),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AuthTextField(
                      controller: emailController,
                      labelText: "Email",
                      type: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    PasswordTextField(controller: passwordController),
                    SizedBox(
                      height: 12.h,
                    ),
                    RowValidPassword(
                      numberAdd: hasNumber,
                      specialChar: hasSpecialChar,
                      lowChar: hasLowerCase,
                      upChar: hasUpperCase,
                      passwordLength: hasPasswordLength,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AuthButton(
                        onPressed: () {
                          signupValidFunction(
                            context: context,
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (hasNumber &&
                              hasPasswordLength &&
                              hasUpperCase &&
                              hasLowerCase &&
                              hasSpecialChar == true) {
                            context.read<AuthCubit>().createUser(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        buttonText: ConfingLang.localizations['signUp']),
                    SizedBox(
                      height: 17.h,
                    ),
                    HaveAccountOrNot(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.signIn);
                      },
                      text: ConfingLang.localizations['doYouHaveAccount'],
                      textButton: ConfingLang.localizations["signIn"],
                    ),
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
        });
  }
}
