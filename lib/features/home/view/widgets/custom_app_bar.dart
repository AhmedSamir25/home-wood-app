import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/constant/asstes_images_manager.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ConfingLang.localizations["appbarHome"],style:StyleText.textStyle22,),
        const Spacer(flex: 4,),
        CircleAvatar(backgroundImage: AssetImage(AsstesImagesManager.furniture,),
        radius: 26.w,
        backgroundColor: AppColors.amberColor,
        ),
        const Spacer(flex: 1,),
      ],
    );
  }
}