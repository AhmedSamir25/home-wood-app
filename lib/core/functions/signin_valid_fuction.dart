import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homewood/core/functions/show_snack_bar.dart';
import 'package:homewood/core/theme/color_app.dart';
final RegExp passwordRegExp = RegExp(
  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$])[A-Za-z\d@#$]{8,}$',
);
void signInAndValidFunction({required BuildContext context, required String email , required String password, required Function() onPerasd}){
  if(email.isEmpty && password.isEmpty){
    showSnackBar(context, "please feal all fields", AppColors.redColor);
    return;
  }
  if(!EmailValidator.validate(email)){
    showSnackBar(context, "message", AppColors.redColor);
    return;
  }
  if(!passwordRegExp.hasMatch(password)) {
    showSnackBar(context, "passwordMessage", AppColors.redColor);
    return;
  }
}
