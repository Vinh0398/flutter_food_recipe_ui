import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_food_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListFoodResponse {
  int? status;
  List<FoodEntity>? data;
  String? errorMessage;

  ListFoodResponse({this.status, this.data, this.errorMessage});

  factory ListFoodResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFoodResponseToJson(this);
}
