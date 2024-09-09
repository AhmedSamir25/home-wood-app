import 'package:flutter/material.dart';
import 'package:homewood/core/utils/storage/save_userid.dart';
import 'package:homewood/features/auth/view/signup_view.dart';
import 'package:homewood/features/home/view/home_view.dart';

class CheckUserLogin extends StatelessWidget {
  const CheckUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    SaveUserId saveUserId = SaveUserId();
    if (saveUserId.getUserId() == 0 ) {
      return const SignupView();
    }else{
    return const HomeView();
  }
  }
}