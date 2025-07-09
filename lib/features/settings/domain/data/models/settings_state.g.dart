// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    _SettingsState(
      selectedPrinter: json['selectedPrinter'] as String?,
      selectedPrinterAddress: json['selectedPrinterAddress'] as String?,
      cameraOrientation: json['cameraOrientation'] as String? ?? 'front',
    );

Map<String, dynamic> _$SettingsStateToJson(_SettingsState instance) =>
    <String, dynamic>{
      'selectedPrinter': instance.selectedPrinter,
      'selectedPrinterAddress': instance.selectedPrinterAddress,
      'cameraOrientation': instance.cameraOrientation,
    };
