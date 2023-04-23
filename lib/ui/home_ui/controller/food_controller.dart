import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_all_food_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_list_food_use_case.dart';

class FoodListCubit extends Cubit<List<FoodEntity>> {
  final GetAllFoodUseCase getAllFoodUseCase;
  final GetListFoodUseCase getListFoodUseCase;

  FoodListCubit(
    List<FoodEntity> initialState,
    this.getAllFoodUseCase,
    this.getListFoodUseCase,
  ) : super(initialState);

  Future<void> fetchAllListFood({String? categoryId}) async {
    if (categoryId == null) {
      final result = await getAllFoodUseCase.invoke(param: null);
      emit(result);
      return;
    }
    final result = await getListFoodUseCase.invoke(param: categoryId);
    emit(result);
  }
}
