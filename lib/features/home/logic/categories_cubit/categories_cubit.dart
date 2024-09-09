import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/features/home/data/model/categories_model.dart';
import 'package:homewood/features/home/data/repo/home_repo.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchCategories() async{
    emit(CategoriesLoading());
    var result = await homeRepo.getCategories();
    result.fold((failure) => emit(CategoriesFailer(failure.errMessage)),
      (categoriesModel) => emit(CategoriesSuccess(categoriesModel.categories??[]))
     );
  }
}
