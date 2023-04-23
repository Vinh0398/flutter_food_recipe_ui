import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/respository/food_respository.dart';
import 'package:flutter_food_recipe_ui/domain/base_use_case.dart';

class GetListFoodUseCase extends BaseUseCase<List<FoodEntity>, String?> {
  final FoodRepository repository;

  GetListFoodUseCase({required this.repository});

  @override
  Future<List<FoodEntity>> invoke({required String? param}) async {
    final result =
        await repository.getListFoodFromCategoryId(categoryId: param);
    return result;
  }
}
