import 'package:flutter_food_recipe_ui/data/food/data_source/food_retrofit.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/respository/food_respository.dart';

class FoodRemoteDataSource implements FoodDataSource {
  final FoodRetrofit foodRetrofit;

  FoodRemoteDataSource(this.foodRetrofit);

  @override
  Future<List<FoodEntity>> getListFood() async {
    var res = await foodRetrofit.getListFood();
    return res.data ?? [];
  }

  @override
  Future<List<FoodEntity>> getListFoodFromCategoryId({
    String? categoryId,
  }) async {
    var res = await foodRetrofit.getListFoodFromCategoryId(categoryId!);
    return res.data ?? [];
  }

  @override
  Future<FoodEntity> getFood({required String foodId}) async{
    var res = await foodRetrofit.getFoodFromFoodId(foodId);
    return res.data;
  }
}
