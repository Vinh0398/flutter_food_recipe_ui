import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_by_id_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FoodByIdResponse {
  FoodEntity data;
  int? status;
  String? errorMessage;

  FoodByIdResponse({this.status, required this.data, this.errorMessage});

  factory FoodByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodByIdResponseToJson(this);
}
