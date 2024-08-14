import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/style_text.dart';
class HeadBodyText extends StatelessWidget {

  const HeadBodyText({super.key, required this.headText, required this.bodyText});
  final String headText;
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Center(
        child:  Column(
          children: [
            Text(headText,style: StyleText.textStyle27,),
            SizedBox(height: 10.h,),
            Text(bodyText,style: StyleText.textStyle18),
          ],
        ),
      ),
    );
  }
}
