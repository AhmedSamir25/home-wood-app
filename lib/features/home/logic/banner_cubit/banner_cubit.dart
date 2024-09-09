import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/features/home/data/model/banner_model.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.homeRepo) : super(BannerInitial());
  
  final HomeRepo homeRepo;

  Future<void> fetchBanners() async {
    emit(BannerLoading());
    var result = await homeRepo.getBanner();
    result.fold(
      (failure) => emit(BannerFailure(failure.errMessage)),
      (bannerModel) => emit(BannerSuccess(bannerModel.banners??[])),
    );
  }
}