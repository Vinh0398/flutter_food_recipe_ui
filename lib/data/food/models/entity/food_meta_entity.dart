import 'package:json_annotation/json_annotation.dart';

part 'food_meta_entity.g.dart';

@JsonSerializable()
class FoodMetaEntity {
  int? prep;
  int? cook;
  String? feed;

  FoodMetaEntity({this.prep, this.cook, this.feed});

  factory FoodMetaEntity.fromJson(Map<String, dynamic> json) =>
      _$FoodMetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FoodMetaEntityToJson(this);
}
