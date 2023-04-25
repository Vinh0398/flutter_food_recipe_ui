import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_food_use_case.dart';

class FoodDetailState {
  FoodEntity? food;

  FoodDetailState({
    required this.food,
  });
}

class FoodDetailCubit extends Cubit<FoodDetailState> {
  final GetFoodUseCase getFoodUseCase;

  FoodDetailCubit({
    required this.getFoodUseCase,
  }) : super(FoodDetailState(food: null));

  Future<FoodEntity?> getFoodDetail({required String foodId}) async {
    final result = await getFoodUseCase.invoke(param: foodId);
    emit(FoodDetailState(food: result));
    return result;
  }
}
