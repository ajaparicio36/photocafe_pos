import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:flutter_thermal_printer/utils/printer.dart';
import 'package:photocafe_pos/features/print/domain/data/models/printer_state.dart';

class PrintNotifier extends StreamNotifier<PrinterState> {
  final FlutterThermalPrinter _flutterThermalPrinter =
      FlutterThermalPrinter.instance;
  StreamSubscription<List<Printer>>? _devicesStreamSubscription;

  @override
  Stream<PrinterState> build() async* {
    await _flutterThermalPrinter.getPrinters(
      connectionTypes: [
        ConnectionType.USB,
        ConnectionType.BLE,
        ConnectionType.NETWORK,
      ],
    );

    yield* _flutterThermalPrinter.devicesStream.asyncMap((printers) {
      final filtered = List<Printer>.from(printers)
        ..removeWhere((element) => element.name == null || element.name == '');
      return PrinterState(connectedPrinters: filtered);
    });
  }

  Future<void> printImage(
    BuildContext context,
    Widget widget,
    Printer printer,
  ) async {
    await _flutterThermalPrinter.printWidget(
      context,
      printer: printer,
      widget: widget,
    );
  }

  void stopScan() {
    _flutterThermalPrinter.stopScan();
    _devicesStreamSubscription?.cancel();
  }
}

final printProvider = StreamNotifierProvider<PrintNotifier, PrinterState>(
  PrintNotifier.new,
);
