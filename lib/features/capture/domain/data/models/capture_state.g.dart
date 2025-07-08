// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaptureState _$CaptureStateFromJson(Map<String, dynamic> json) =>
    _CaptureState(
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      framePath: json['framePath'] as String?,
      hasRetake: json['hasRetake'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CaptureStateToJson(_CaptureState instance) =>
    <String, dynamic>{
      'image': instance.image,
      'framePath': instance.framePath,
      'hasRetake': instance.hasRetake,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
