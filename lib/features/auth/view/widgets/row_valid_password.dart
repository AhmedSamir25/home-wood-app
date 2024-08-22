import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';

class RowValidPassword extends StatefulWidget {
  const RowValidPassword({super.key, required this.numberAdd, required this.specialChar, required this.upChar, required this.lowChar, required this.passwordLength});
  final bool numberAdd , specialChar , upChar , lowChar , passwordLength;
  @override
  State<RowValidPassword> createState() => _RowValidPasswordState();
}

class _RowValidPasswordState extends State<RowValidPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isValidRow(text: 'At least 1 number', isValid: widget.numberAdd),
        isValidRow(text: 'At least 1 special character', isValid: widget.specialChar),
        isValidRow(text: 'At least 1 uppercase character', isValid: widget.upChar),
        isValidRow(text: 'At least 1 lowercase character', isValid: widget.lowChar),
        isValidRow(text: 'At least 8 characters', isValid: widget.passwordLength),
      ],
    );
  }
}
Widget isValidRow({required String text ,required bool isValid}){
  return Row(
    children: [
      CircleAvatar(radius: 4.w,backgroundColor: isValid ? AppColors.blackColor : AppColors.redColor,),
      SizedBox(width: 5.w,),
      Text(text,style: StyleText.textStyle14.copyWith(
        decoration: isValid ? TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: AppColors.amberColor,
        decorationThickness: 2,
        color: isValid ? AppColors.blackColor : AppColors.redColor,
      ),),
    ],
  );
}