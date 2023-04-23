import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/domain/category/get_all_category_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/category/get_detail_category_usecase.dart';

class CategoryListCubit extends Cubit<List<CategoryEntity>> {
  final GetAllCategoryUseCase getAllCategoryUseCase;
  CategoryListCubit(
      List<CategoryEntity> initialState, this.getAllCategoryUseCase)
      : super(initialState);

  Future<void> fetchAllCategories() async {
    final result = await getAllCategoryUseCase.invoke(param: null);
    emit(result);
  }
}

class CategoryDetailCubit extends Cubit<CategoryEntity?> {
  final GetDetailCategoryUseCase getCategoryDetailUseCase;
  CategoryDetailCubit(
      CategoryEntity? initialState, this.getCategoryDetailUseCase)
      : super(initialState);

  Future<void> fetchListCategory(String? categoryId) async {
    final result = await getCategoryDetailUseCase.invoke(param: categoryId);
    emit(result);
  }
}
