part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final List<Products> product;
  const ProductDetailsSuccess(this.product);
}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsFailure extends ProductDetailsState {
  final String errMessage;
  const ProductDetailsFailure(this.errMessage);
}