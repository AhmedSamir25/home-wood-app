part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState{}

final class FavoriteSuccessLoad extends FavoriteState{
  final List<Data> products;

  const FavoriteSuccessLoad(this.products);

  @override
  List<Object> get props => [products];
}

final class FavoriteFaildLoad extends FavoriteState{
final String error;

  const FavoriteFaildLoad(this.error);

  @override
  List<Object> get props => [error];
}

final class FavoriteSuccessAdd extends FavoriteState{}

final class FavoriteFaildAdd extends FavoriteState{
final String error;

  const FavoriteFaildAdd(this.error);

  @override
  List<Object> get props => [error];
}