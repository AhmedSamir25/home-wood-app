import 'package:flutter/material.dart';
import 'package:homewood/core/theme/color_app.dart';
Widget customCircularProgressIndicator({required BuildContext context,}){
    return const Center(
      child: CircularProgressIndicator(
          backgroundColor: AppColors.amberColor),
    );
}
