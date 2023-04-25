// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodEntity _$FoodEntityFromJson(Map<String, dynamic> json) => FoodEntity(
      title: json['title'] as String?,
      id: json['id'] as int?,
      categoryId: json['categoryId'] as int?,
      description: json['description'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      image: json['image'] as String?,
      meta: json['meta'] == null
          ? null
          : FoodMetaEntity.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodEntityToJson(FoodEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'rate': instance.rate,
      'image': instance.image,
      'meta': instance.meta,
    };
