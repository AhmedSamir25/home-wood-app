import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/theme/style_text.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
      prefixIcon: Icon(Icons.search,size: 32.w,),
      hintText: ConfingLang.localizations["searchTextField"],
      hintStyle: StyleText.textStyle18,
      contentPadding: EdgeInsets.all(11.w),
        fillColor: Colors.grey[200],
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      
    );
  }
}