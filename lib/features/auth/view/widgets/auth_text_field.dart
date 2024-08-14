import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.controller, required this.labelText, required this.suffixIcon, });
  final TextEditingController controller;
  final String labelText;
  final Widget suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(labelText),
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
    );
  }
}
