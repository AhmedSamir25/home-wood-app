import 'package:flutter/material.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({super.key, required this.onPressed, required this.textButton, required this.text});
  final Function() onPressed;
  final String textButton;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topStart,
        child: Row(
          children: [
            Text(text,style: StyleText.textStyle14,),
            TextButton(onPressed: onPressed,
              child: Text(textButton,style: StyleText.textStyle14.copyWith(color: AppColors.darkYellow)),),
          ],
        ));
  }
}
