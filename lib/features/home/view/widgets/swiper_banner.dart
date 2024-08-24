import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:homewood/features/home/logic/banner_cubit/banner_cubit.dart';

class SwiperBanner extends StatelessWidget {
  const SwiperBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerSuccess) {
          return SizedBox(
            height: 150.h,
            width: double.infinity,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    state.banners[index].bannerImage!,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: state.banners.length,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
