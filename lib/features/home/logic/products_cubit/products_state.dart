part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState{}

final class ProductsLoadingPage extends ProductsState{}

final class GetProductsSuccess extends ProductsState{
  final List<Data> products;
  const GetProductsSuccess(this.products);
}

final class ProductsFailer extends ProductsState{
  final String error;
  const ProductsFailer(this.error);
  @override
  List<Object> get props => [error];
}

final class ProductsFailerPage extends ProductsState{
  final String error;
  const ProductsFailerPage(this.error);
  @override
  List<Object> get props => [error];
}

final class ProductsCategoriesLoading extends ProductsState{}

final class ProductsCategoriesLoadingPage extends ProductsState{}

final class GetProductsCategoriesSuccess extends ProductsState{
  final List<Data> products;
  const GetProductsCategoriesSuccess(this.products);
}

final class ProductsCategoriesFailer extends ProductsState{
  final String error;
  const ProductsCategoriesFailer(this.error);
  @override
  List<Object> get props => [error];
}


final class ProductsCategoriesFailerPage extends ProductsState{
  final String error;
  const ProductsCategoriesFailerPage(this.error);
  @override
  List<Object> get props => [error];
}