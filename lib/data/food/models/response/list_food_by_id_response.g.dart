// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_food_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFoodByCategoryIdResponse _$ListFoodByCategoryIdResponseFromJson(
        Map<String, dynamic> json) =>
    ListFoodByCategoryIdResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FoodEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$ListFoodByCategoryIdResponseToJson(
        ListFoodByCategoryIdResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'error_message': instance.errorMessage,
    };
