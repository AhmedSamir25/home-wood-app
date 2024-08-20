import 'package:flutter/material.dart';
import 'package:homewood/core/theme/color_app.dart';
void customCircularProgressIndicator({required BuildContext context,}){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
    return const Center(
      child: CircularProgressIndicator(
          backgroundColor: AppColors.amberColor),
    );}
    );
}
