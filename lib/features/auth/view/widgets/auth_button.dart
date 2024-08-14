import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/style_text.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onPressed, required this.buttonText});
  final Function() onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.amber)),
        child: SizedBox(
            height: 40.h,
            width: 170.w,
            child: Center(child: Text(buttonText,style: StyleText.textStyle18.copyWith(color: Colors.black),))));
  }
}
