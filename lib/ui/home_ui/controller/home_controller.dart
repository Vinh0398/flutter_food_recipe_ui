import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/domain/category/get_all_category_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_all_food_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_list_food_use_case.dart';

class HomeState {
  List<CategoryEntity> listCategory;
  int? indexCategorySelected;
  List<FoodEntity> listFood;

  HomeState({
    this.listCategory = const [],
    this.indexCategorySelected,
    this.listFood = const [],
  });
}

class HomePageCubit extends Cubit<HomeState> {
  final GetAllCategoryUseCase getAllCategoryUseCase;
  final GetAllFoodUseCase getAllFoodUseCase;
  final GetListFoodUseCase getListFoodUseCase;

  HomePageCubit(
    this.getAllCategoryUseCase,
    this.getAllFoodUseCase,
    this.getListFoodUseCase,
  ) : super(HomeState());

  Future<void> fetchAllCategories() async {
    final result = await getAllCategoryUseCase.invoke(param: null);
    emit(
      HomeState(
        listCategory: result,
        indexCategorySelected: state.indexCategorySelected,
      ),
    );
  }

  void selectedCategory({int? index}) {
    if (state.indexCategorySelected == index) {
      return;
    }
    emit(
      HomeState(
        listCategory: state.listCategory,
        indexCategorySelected: index,
      ),
    );
  }

  Future<void> fetchAllListFood({String? categoryId}) async {
    if (categoryId == null) {
      final result = await getAllFoodUseCase.invoke(param: null);
      emit(
        HomeState(
          listCategory: state.listCategory,
          indexCategorySelected: state.indexCategorySelected,
          listFood: result,
        ),
      );
      return;
    }
    final result = await getListFoodUseCase.invoke(param: categoryId);
    emit(
      HomeState(
        listCategory: state.listCategory,
        indexCategorySelected: state.indexCategorySelected,
        listFood: result,
      ),
    );
  }
}
