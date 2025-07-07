// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => _ImageModel(
  imagePath: json['imagePath'] as String,
  capturedAt: DateTime.parse(json['capturedAt'] as String),
);

Map<String, dynamic> _$ImageModelToJson(_ImageModel instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'capturedAt': instance.capturedAt.toIso8601String(),
    };
