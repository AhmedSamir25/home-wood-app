import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/home_details/view/widgets/icon_app_bar_home_details.dart';

class AppBarHomeDetails extends StatelessWidget {
  const AppBarHomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 20.h),
      child:  Row(
        children: [
          IconAppBarHomeDetails(icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 26.w,), onPressed: () {  },),
          const Spacer(flex: 24,), 
          IconAppBarHomeDetails(icon: Icon(Icons.favorite_border,color: Colors.white,size: 26.w,), onPressed: () {  },),
          const Spacer(flex: 1,)
        ],
      ),
    );
  }
}

