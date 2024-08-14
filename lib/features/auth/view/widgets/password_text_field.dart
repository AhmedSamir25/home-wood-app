import 'package:flutter/material.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}
class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
        controller: widget.controller,
        labelText: "Password",
        suffixIcon: IconButton(icon: const Icon(Icons.password),onPressed: (){
          setState(() {
            passwordObscure = !passwordObscure;
          });
        },),
        obscureText: passwordObscure);
  }
}
