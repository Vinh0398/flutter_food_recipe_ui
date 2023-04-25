import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_getid_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryGetIdResponseModel {
  int? status;
  CategoryEntity? data;
  String? errorMessage;

  CategoryGetIdResponseModel({this.status, this.data, this.errorMessage});

  factory CategoryGetIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryGetIdResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryGetIdResponseModelToJson(this);
}
