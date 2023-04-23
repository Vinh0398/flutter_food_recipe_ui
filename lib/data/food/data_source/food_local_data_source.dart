import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/respository/food_respository.dart';

class FoodLocalDataSource implements FoodDataSource {
  @override
  Future<List<FoodEntity>> getListFood() {
    // TODO: implement getListFood
    throw UnimplementedError();
  }

  @override
  Future<List<FoodEntity>> getListFoodFromCategoryId({String? categoryId}) {
    // TODO: implement getListFoodFromCategoryId
    throw UnimplementedError();
  }
}
