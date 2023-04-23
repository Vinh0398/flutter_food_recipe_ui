import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/respository/food_respository.dart';
import 'package:flutter_food_recipe_ui/domain/base_use_case.dart';

class GetAllFoodUseCase extends BaseUseCase<List<FoodEntity>, void> {
  final FoodRepository foodRepository;

  GetAllFoodUseCase({required this.foodRepository});

  @override
  Future<List<FoodEntity>> invoke({required void param}) async {
    final result = await foodRepository.getListFood();
    return result;
  }
}
