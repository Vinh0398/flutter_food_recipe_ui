// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryResponseModel _$ListCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListCategoryResponseModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$ListCategoryResponseModelToJson(
        ListCategoryResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'error_message': instance.errorMessage,
    };
