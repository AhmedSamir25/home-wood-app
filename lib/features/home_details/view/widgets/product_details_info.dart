import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';
import 'package:homewood/features/home_details/view/widgets/add_to_cart_button.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.categoryName, required this.inCart});
  final String productName, productDescription, categoryName;
  final double productPrice;
  final bool inCart;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 364.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.grayColor300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(categoryName,style: StyleText.textStyle14,)),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Text(
                    productName,
                    style: StyleText.textStyle27Bold,
                  ),
                  const Spacer(flex: 5),
                  Text(
                    productPrice.toString(),
                    style: StyleText.textStyle27Bold,
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              SizedBox(height: 5.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    productDescription,
                    style: StyleText.textStyle18,
                    maxLines: null,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              AddToCartButton(inCart: inCart,),
            ],
          ),
        ),
      ),
    );
  }
}