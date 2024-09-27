import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.inCart});
  final bool inCart;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
                size: 30.sp,
              ),
              SizedBox(width: 10.w),
              Text(
                inCart ? "In Cart" : "Add to Cart" ,
                style: StyleText.textStyle22.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}