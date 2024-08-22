import 'package:flutter/material.dart';
import 'package:homewood/core/theme/color_app.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.controller, required this.labelText, required this.suffixIcon, required this.obscureText, required this.type, });
  final TextEditingController controller;
  final String labelText;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(labelText,style: const TextStyle(color: AppColors.blackColor,fontFamily: "Rubik"),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
