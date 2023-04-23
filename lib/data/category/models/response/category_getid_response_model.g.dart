// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_getid_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryGetIdResponseModel _$CategoryGetIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    CategoryGetIdResponseModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : CategoryEntity.fromJson(json['data'] as Map<String, dynamic>),
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$CategoryGetIdResponseModelToJson(
        CategoryGetIdResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'error_message': instance.errorMessage,
    };
