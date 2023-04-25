// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodByIdResponse _$FoodByIdResponseFromJson(Map<String, dynamic> json) =>
    FoodByIdResponse(
      status: json['status'] as int?,
      data: FoodEntity.fromJson(json['data'] as Map<String, dynamic>),
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$FoodByIdResponseToJson(FoodByIdResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error_message': instance.errorMessage,
    };
