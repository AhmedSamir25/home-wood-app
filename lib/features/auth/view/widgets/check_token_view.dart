import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/auth/view/widgets/auth_button.dart';
import 'package:homewood/features/auth/view/widgets/auth_text_field.dart';

class CheckTokenView extends StatelessWidget {
  const CheckTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: ListView(
          children: [
            SizedBox(height:  100.h,),
            AuthTextField(controller: emailController,
                labelText: "Email", suffixIcon: const Icon(Icons.email),
                obscureText: false),
            SizedBox(height: 20.h,),
            AuthButton(onPressed: (){},
                buttonText: "send token")
          ],
        ),
      ),
    );
  }
}
