import 'package:flutter/material.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.shimmerWidth, required this.shimmerHeight, required this.axis});
  final double shimmerWidth;
  final double shimmerHeight;
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SizedBox(
        width: shimmerWidth,
        height: shimmerHeight,
        child: Shimmer.fromColors(
          baseColor: AppColors.buleGray,
          highlightColor: AppColors.grayColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.grayColor, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      );
      },
      itemCount: 15,
      scrollDirection: axis,
    );
  }
}