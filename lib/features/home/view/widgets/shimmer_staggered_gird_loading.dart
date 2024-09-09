import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerStaggeredGirdLoading extends StatelessWidget {
  const ShimmerStaggeredGirdLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150.w,
          height: 100.h,
          child: Shimmer.fromColors(
            baseColor: AppColors.buleGray,
            highlightColor: AppColors.grayColor,
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 15.h,
                    decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}