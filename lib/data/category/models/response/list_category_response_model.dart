import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_category_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListCategoryResponseModel {
  int? status;
  List<CategoryEntity>? data;
  String? errorMessage;

  ListCategoryResponseModel({this.status, this.data, this.errorMessage});

  factory ListCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryResponseModelToJson(this);
}
