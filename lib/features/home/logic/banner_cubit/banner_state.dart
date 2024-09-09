part of 'banner_cubit.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<Banner> banners;

  const BannerSuccess(this.banners);

  @override
  List<Object> get props => [banners];
}

class BannerFailure extends BannerState {
  final String error;

  const BannerFailure(this.error);

  @override
  List<Object> get props => [error];
}