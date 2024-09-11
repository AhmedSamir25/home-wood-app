import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:homewood/core/router/app_router.dart';
import 'package:homewood/core/theme/style_text.dart';
import 'package:homewood/features/home/data/model/product_model.dart';
import 'package:homewood/features/home/logic/products_cubit/products_cubit.dart';
import 'package:homewood/features/home/view/widgets/shimmer_staggered_gird_loading.dart';

class StaggeredGridAllProducts extends StatefulWidget {
  const StaggeredGridAllProducts({super.key});

  @override
  State<StaggeredGridAllProducts> createState() => _StaggeredGridAllProductsState();
}

class _StaggeredGridAllProductsState extends State<StaggeredGridAllProducts> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 2;
  List<Data> products = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    BlocProvider.of<ProductsCubit>(context).fetchProducts();
  }

  void _scrollListener() async {
    var currentPosstion = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosstion >= 0.6 * maxScrollLength) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        await BlocProvider.of<ProductsCubit>(context).fetchProducts(pageNumber: nextPage++);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is GetProductsSuccess) {
          products.addAll(state.products);
          isLoading = false;
        }
      },
      builder: (context, state) {
        if (state is GetProductsSuccess || state is ProductsLoadingPage || state is ProductsFailerPage) {       
          return Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: SingleChildScrollView(
            controller: _scrollController,
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                axisDirection: AxisDirection.down,
                children: List.generate(
                  products.length,
                  (index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                        AppRouter.homeDetailsView,
                        extra: product.productId
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            ),
                             child: Image.network(product.productImage!,fit: BoxFit.fill,width: 150.w,),
                          ),
                          Text("${product.productPrice.toString()} \$", style: StyleText.textStyle18.copyWith(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.h,),
                          Text(product.productName!, style: StyleText.textStyle14),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is ProductsLoading) {
          return const ShimmerStaggeredGirdLoading();
        } else if (state is ProductsFailer) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text("Failed to load products"));
        }
      },
    );
  }
}

