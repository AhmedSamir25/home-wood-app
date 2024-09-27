import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/features/home_details/data/model/product_details_model.dart';
import 'package:homewood/features/home_details/data/repo/home_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.homeDetailsRepo) : super(ProductDetailsInitial());
  final HomeDetailsRepo homeDetailsRepo;
  Future<void> getProductDetails({required int productId}) async{
    emit(ProductDetailsLoading());
    var result = await homeDetailsRepo.getProductDetails(productId: productId);
    result.fold((failure)=> emit(ProductDetailsFailure(failure.errMessage)),
     (productDetailsModel)=> emit(ProductDetailsSuccess(productDetailsModel.products?? []))
     );
  }
}
