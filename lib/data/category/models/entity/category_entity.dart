import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

@JsonSerializable()
class CategoryEntity {
  int? id;
  String? name;
  String? image;
  String? description;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
