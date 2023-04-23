import 'package:flutter_food_recipe_ui/data/category/models/response/category_getid_response_model.dart';
import 'package:flutter_food_recipe_ui/data/category/models/response/list_category_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'category_retrofit.g.dart';

@RestApi(baseUrl: "http://192.168.1.9:8080")
abstract class CategoryRetrofit {
  factory CategoryRetrofit(Dio dio, {String baseUrl}) = _CategoryRetrofit;

  @GET("/category/")
  Future<ListCategoryResponseModel> getListCategory();
  /*
 https://pub.dev/packages/retrofit
 */
  @GET("/category/{id}")
  Future<CategoryGetIdResponseModel> getCategoryDetailById(
      @Path("id") String id);
}
