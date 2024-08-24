import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/constant/asstes_images_manager.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperBanner extends StatelessWidget {
  const SwiperBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            AsstesImagesManager.furniture,
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
      ),
    );
  }
}
