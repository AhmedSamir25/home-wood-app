import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';

class IconAppBarHomeDetails extends StatelessWidget {
  const IconAppBarHomeDetails({
    super.key, required this.icon, required this.onPressed,
  });
    final Icon icon;
    final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 45.w,
    height: 45.h,
      decoration: BoxDecoration(
      color: AppColors.grayColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: IconButton(icon: icon,onPressed: onPressed,),
    );
  }
}