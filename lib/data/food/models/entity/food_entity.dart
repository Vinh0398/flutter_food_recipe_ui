import 'package:flutter_food_recipe_ui/data/food/models/entity/food_meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_entity.g.dart';

@JsonSerializable()
class FoodEntity {
  String? title;
  int? id;
  int? categoryId;
  String? description;
  double? rate;
  String? image;
  FoodMetaEntity? meta;

  FoodEntity(
      {this.title,
      this.id,
      this.categoryId,
      this.description,
      this.rate,
      this.image,
      this.meta});

  factory FoodEntity.fromJson(Map<String, dynamic> json) =>
      _$FoodEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FoodEntityToJson(this);
}
