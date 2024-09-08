import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/theme/style_text.dart';
import 'package:homewood/features/home/logic/products_cubit/products_cubit.dart';

class CustomStaggeredGridProductsCategories extends StatelessWidget {
  const CustomStaggeredGridProductsCategories({super.key, required this.categoreyId});
  final int categoreyId;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).fetchProductsByCategories(categoreyId: categoreyId, pageNumber: 1);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is GetProductsCategoriesSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.h),
            child: StaggeredGrid.count(
              crossAxisCount: 2, 
              crossAxisSpacing: 20, 
              mainAxisSpacing: 20,
              axisDirection: AxisDirection.down,  
              children: List.generate(
                state.products.length, 
                (index) {
                  final product = state.products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.grayColor300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children:[ 
                      Image.network(product.productImage!,width: 150.w,fit: BoxFit.fill,),
                      Text("${product.productPrice.toString()} \$",style: StyleText.textStyle18,),
                      Text(product.productName!,style: StyleText.textStyle14,),
                    ]),
                  );
                },
              ),
            ),
          );
        } else if (state is ProductsCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }else if(state is ProductsCategoriesFailer){
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text("Failed to load products"));
        }
      },
    );
  }
}
