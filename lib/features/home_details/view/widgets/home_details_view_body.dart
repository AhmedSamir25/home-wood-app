import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/home_details/logic/cubit/product_details_cubit.dart';
import 'package:homewood/features/home_details/view/widgets/app_bar_home_details.dart';
import 'package:homewood/features/home_details/view/widgets/product_details_info.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return Stack(
            children: [
              Image.network(
                state.product[0].productImage!,
                width: double.infinity,
                height: 350.h,
                fit: BoxFit.fill,
              ),
              ProductDetailsInfo(
              productName: state.product[0].productName ?? "",
              productDescription: state.product[0].productDescription ?? "",
              categoryName: state.product[0].categoryName?? "",
              productPrice:  state.product[0].productPrice ?? 0.0, inCart: state.product[0].inCart??false,),
              AppBarHomeDetails(inFavorite: state.product[0].isFavorite??false,),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
