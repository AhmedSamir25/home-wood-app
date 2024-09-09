import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homewood/core/theme/style_text.dart';
import 'package:homewood/features/home/data/model/product_model.dart';
import 'package:homewood/features/home/logic/products_cubit/products_cubit.dart';

class CustomStaggeredGridProductsCategories extends StatefulWidget {
  const CustomStaggeredGridProductsCategories({super.key, required this.categoreyId});
  final int categoreyId;

  @override
  State<CustomStaggeredGridProductsCategories> createState() => _CustomStaggeredGridProductsCategoriesState();
}

class _CustomStaggeredGridProductsCategoriesState extends State<CustomStaggeredGridProductsCategories> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 2;
  List<Data> products = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    BlocProvider.of<ProductsCubit>(context).fetchProductsByCategories(categoreyId: widget.categoreyId);
  }

  void _scrollListener() async {
    var currentPosstion = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosstion >= 0.6 * maxScrollLength) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        await BlocProvider.of<ProductsCubit>(context).fetchProductsByCategories(pageNumber: nextPage++,categoreyId: widget.categoreyId);
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
        if (state is GetProductsCategoriesSuccess) {
          products.addAll(state.products);
          isLoading = false;
        }
      },
      builder: (context, state) {
        if (state is GetProductsCategoriesSuccess || state is ProductsCategoriesLoadingPage || state is ProductsCategoriesFailerPage) {
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
                    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children:[ 
                      Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                      ),
                      child: Image.network(product.productImage!,width: 150.w,fit: BoxFit.fill,)),
                      Text("${product.productPrice.toString()} \$",style: StyleText.textStyle18.copyWith(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4.h,),
                      Text(product.productName!,style: StyleText.textStyle14,),
                    ]);
                  },
                ),
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
