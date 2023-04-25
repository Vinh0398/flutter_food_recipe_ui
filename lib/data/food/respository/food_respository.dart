import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';

abstract class FoodDataSource {
  ///get list Food
  Future<List<FoodEntity>> getListFood();
  Future<List<FoodEntity>> getListFoodFromCategoryId(
      {required String? categoryId});
  Future<FoodEntity> getFood({required String foodId});
}

class FoodRepository implements FoodDataSource {
  final FoodDataSource remoteDataSource;
  final FoodDataSource localDataSource;

  FoodRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<FoodEntity>> getListFood() {
    return remoteDataSource.getListFood();
  }

  @override
  Future<List<FoodEntity>> getListFoodFromCategoryId(
      {required String? categoryId}) {
    return remoteDataSource.getListFoodFromCategoryId(categoryId: categoryId);
  }

  @override
  Future<FoodEntity> getFood({required String foodId}) {
    return remoteDataSource.getFood(foodId: foodId);
  }
}
