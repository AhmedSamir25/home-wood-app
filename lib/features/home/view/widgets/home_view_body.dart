import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/home/view/widgets/swiper_banner.dart';
import 'package:homewood/features/home/view/widgets/custom_app_bar.dart';
import 'package:homewood/features/home/view/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Column(
        children: [
            SizedBox(height: 24.h,),
            const CustomAppBar(),
            SizedBox(height: 18.h,),
            const SearchTextField(),
            SizedBox(height: 18.h,),
            const SwiperBanner()
          ],
        ),
      ),
    );
  }
}