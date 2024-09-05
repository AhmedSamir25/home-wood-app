import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homewood/features/home/logic/categories_cubit/categories_cubit.dart';

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
        if (state is CategoriesSuccess) {
          for (var i = 0; i < state.categories.length; i++) {
            tabs.add(Tab(
              text: state.categories[i].categoryName,
            ));
          }
          return DefaultTabController(
            initialIndex: 1,
            length: tabs.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonsTabBar(
                  tabs: tabs,
                  height: 40.h,
                  width: 110.w,
                  backgroundColor: Colors.black,
                  contentCenter: true,
                  buttonMargin: EdgeInsets.only(right: 18.w),
                  unselectedBackgroundColor: Colors.grey[300],
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  physics: const ClampingScrollPhysics(), // لمنع الحركة السريعة للتبويبات
                ),
                SizedBox(
                  height: 100,
                  child: TabBarView(
                    children: tabs.map((tab) {
                      return Center(child: Text(tab.text ?? ""));
                    }).toList(),
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
