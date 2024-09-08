import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homewood/features/home/data/model/product_model.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchProducts()async{
    emit(ProductsLoading());
    var result = await homeRepo.getProducts(pageNumber: 1);
    result.fold((failure) => emit(ProductsFailer(failure.errMessage)),
     (productModel)=> emit(GetProductsSuccess(productModel.products!.data ?? [])));
  }

  Future<void> fetchProductsByCategories({required int categoreyId, required int pageNumber}) async{
    emit(ProductsCategoriesLoading());
    var result = await homeRepo.getProductsCategories(categoreyId: categoreyId,pageNumber: pageNumber);
    result.fold((failure) => emit(ProductsCategoriesFailer(failure.errMessage)),
     (productModel) => emit(GetProductsCategoriesSuccess(productModel.products!.data?? []))
     );
  }
}
