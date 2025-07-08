// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrinterState _$PrinterStateFromJson(Map<String, dynamic> json) =>
    _PrinterState(
      connectedPrinters:
          (json['connectedPrinters'] as List<dynamic>?)
              ?.map((e) => Printer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$PrinterStateToJson(_PrinterState instance) =>
    <String, dynamic>{
      'connectedPrinters': instance.connectedPrinters,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
