import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_food_by_id_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListFoodByCategoryIdResponse {
  int? status;
  List<FoodEntity>? data;
  String? errorMessage;

  ListFoodByCategoryIdResponse({this.status, this.data, this.errorMessage});

  factory ListFoodByCategoryIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFoodByCategoryIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFoodByCategoryIdResponseToJson(this);
}
