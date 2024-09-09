import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/core/theme/color_app.dart';
import 'package:homewood/core/utils/widgets/custom_shimmer.dart';
import 'package:homewood/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:homewood/features/home/view/widgets/custom_staggered_grid.dart';
import 'package:homewood/features/home/view/widgets/custom_staggered_grid_products_categories.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      const Tab(
        text: "All",
      )
    ];
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return SizedBox(
          height: 43.h,
          child: CustomShimmer(shimmerWidth: 110.w, shimmerHeight: 40.h,axis: Axis.horizontal,));
        }
        else if (state is CategoriesSuccess) {
          for (var i = 0; i < state.categories.length; i++) {
            tabs.add(Tab(
              text: state.categories[i].categoryName,
            ));
          }
           List<Widget> tabViews = List.generate(tabs.length, (index) {
            if (index == 0) {
              return const StaggeredGridAllProducts();
            } else {
              return CustomStaggeredGridProductsCategories(categoreyId: state.categories[index-1].categoryId! );
            }
          });
          return DefaultTabController(
            initialIndex: 0,
            length: tabs.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonsTabBar(
                  tabs: tabs,
                  height: 40.h,
                  width: 110.w,
                  backgroundColor: AppColors.blackColor,
                  contentCenter: true,
                  buttonMargin: EdgeInsets.only(right: 18.w),
                  unselectedBackgroundColor: AppColors.grayColor300,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.amberColor,
                    fontWeight: FontWeight.bold
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  physics: const ClampingScrollPhysics(), 
                ),
                SizedBox(
                height: 273.h,
                  child: TabBarView(
                    children: tabViews,
                  ),
                ),
              ],
            ),
          );
        } else if (state is CategoriesFailer) {
          return Text(state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
