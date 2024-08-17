import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final passwordController2 = TextEditingController();
    return Scaffold(
      body: ListView(
        children: [
          AuthTextField(controller: passwordController,
              labelText: "Password",
              suffixIcon: const Icon(Icons.password),
              obscureText: true),
            SizedBox(height: 10.h,),
          AuthTextField(controller: passwordController2,
              labelText: "Password",
              suffixIcon: const Icon(Icons.password),
              obscureText: true),
          AuthButton(onPressed: (){},
              buttonText: "Reset")
        ],
      ),
    );
  }
}
