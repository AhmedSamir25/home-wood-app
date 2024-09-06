part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState{}

final class GetProductsSuccess extends ProductsState{
  final List<Data> products;
  const GetProductsSuccess(this.products);
  @override
  List<Object> get props => [products];
}

final class ProductsFailer extends ProductsState{
  final String error;
  const ProductsFailer(this.error);
  @override
  List<Object> get props => [error];
}