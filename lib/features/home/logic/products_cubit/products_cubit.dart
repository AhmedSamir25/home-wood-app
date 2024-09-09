import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homewood/features/home/data/model/product_model.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchProducts({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(ProductsLoading());
    } else {
      emit(ProductsLoadingPage());
    }

    var result = await homeRepo.getProducts(pageNumber: pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 1) {
          return emit(ProductsFailer(failure.errMessage));
        }else{
        return emit(ProductsFailerPage(failure.errMessage));
        }
      },
      (productModel) => emit(GetProductsSuccess(productModel.products?.data ?? [])),
    );
  }

  Future<void> fetchProductsByCategories({required int categoreyId,  int pageNumber = 1}) async {
    if(pageNumber == 1){
    emit(ProductsCategoriesLoading());
    }else{
      emit(ProductsCategoriesLoadingPage());
    }
    var result = await homeRepo.getProductsCategories(categoreyId: categoreyId, pageNumber: pageNumber);
    result.fold(
      (failure) {
      if (pageNumber == 1) {
        emit(ProductsCategoriesFailer(failure.errMessage));
      }else{
        emit(ProductsCategoriesFailerPage(failure.errMessage));
      }
      },
      (productModel) => emit(GetProductsCategoriesSuccess(productModel.products?.data ?? [])),
    );
  }
}
