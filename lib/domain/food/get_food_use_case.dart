import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/respository/food_respository.dart';
import 'package:flutter_food_recipe_ui/domain/base_use_case.dart';

class GetFoodUseCase extends BaseUseCase<FoodEntity, String> {
  final FoodRepository foodRepository;

  GetFoodUseCase({required this.foodRepository});

  @override
  Future<FoodEntity> invoke({required String param}) async {
    final result = await foodRepository.getFood(foodId: param);
    return result;
  }
}
