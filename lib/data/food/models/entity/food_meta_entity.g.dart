// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_meta_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodMetaEntity _$FoodMetaEntityFromJson(Map<String, dynamic> json) =>
    FoodMetaEntity(
      prep: json['prep'] as int?,
      cook: json['cook'] as int?,
      feed: json['feed'] as String?,
    );

Map<String, dynamic> _$FoodMetaEntityToJson(FoodMetaEntity instance) =>
    <String, dynamic>{
      'prep': instance.prep,
      'cook': instance.cook,
      'feed': instance.feed,
    };
