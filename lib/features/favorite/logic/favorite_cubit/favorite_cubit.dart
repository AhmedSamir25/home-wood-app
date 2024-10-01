import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/features/favorite/data/repo/favorite_repo.dart';
import 'package:homewood/features/home/data/model/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;

  Future<void> fetchFavoritesProducts() async {
    emit(FavoriteLoading());
    var result = await favoriteRepo.getProductsFromFavorite();
    result.fold(
      (failure) => emit(FavoriteFaildLoad(failure.errMessage)),
      (productModel) => emit(FavoriteSuccessLoad(productModel.products?.data??[])),
    );
  }
  Future<void> addFavoritesProduct({required int productId}) async {
    emit(FavoriteLoading());
    var result = await favoriteRepo.addProductsToFavorite(productId: productId);
    result.fold(
      (failure) => emit(FavoriteFaildAdd(failure.errMessage)),
      (productModel) => emit(FavoriteSuccessAdd()),
    );
  }
}
