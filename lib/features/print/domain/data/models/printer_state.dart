import 'package:flutter_thermal_printer/utils/printer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_state.freezed.dart';
part 'printer_state.g.dart';

@freezed
sealed class PrinterState with _$PrinterState {
  const factory PrinterState({
    @Default([]) List<Printer> connectedPrinters,
    @Default(false) bool isLoading,
    String? error,
  }) = _PrinterState;

  factory PrinterState.fromJson(Map<String, dynamic> json) =>
      _$PrinterStateFromJson(json);
}
