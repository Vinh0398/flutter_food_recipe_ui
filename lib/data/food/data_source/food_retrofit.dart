import 'package:flutter_food_recipe_ui/data/food/models/response/list_food_by_id_response.dart';
import 'package:flutter_food_recipe_ui/data/food/models/response/list_food_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'food_retrofit.g.dart';

@RestApi(baseUrl: "http://192.168.1.9:8080")
abstract class FoodRetrofit {
  factory FoodRetrofit(Dio dio, {String baseUrl}) = _FoodRetrofit;

  @GET("/food/")
  Future<ListFoodResponse> getListFood();

  @GET("/food/")
  Future<ListFoodByCategoryIdResponse> getListFoodFromCategoryId(
    @Query("categoryId") String categoryId,
  );
}
