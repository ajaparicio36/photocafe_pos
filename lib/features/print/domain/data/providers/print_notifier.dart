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
      connectionTypes: [ConnectionType.USB, ConnectionType.BLE],
    );

    yield* _flutterThermalPrinter.devicesStream.asyncMap((printers) {
      final filtered = List<Printer>.from(printers)
        ..removeWhere((element) => element.name == null || element.name == '');

      // Sort to prioritize USB printers
      filtered.sort((a, b) {
        if (a.connectionType == ConnectionType.USB &&
            b.connectionType != ConnectionType.USB) {
          return -1;
        } else if (a.connectionType != ConnectionType.USB &&
            b.connectionType == ConnectionType.USB) {
          return 1;
        }
        return 0;
      });

      return PrinterState(connectedPrinters: filtered);
    });
  }

  Future<void> refreshPrinters() async {
    await _flutterThermalPrinter.getPrinters(
      connectionTypes: [ConnectionType.USB, ConnectionType.BLE],
    );
  }

  Future<void> connect(Printer printer) async {
    await _flutterThermalPrinter.connect(printer);
  }

  Future<void> disconnect(Printer printer) async {
    await _flutterThermalPrinter.disconnect(printer);
  }

  // Simple test method to check if printer responds to basic commands
  Future<void> testPrint(Printer printer) async {
    try {
      debugPrint('Testing basic print commands for ${printer.name}');

      // Basic ESC/POS commands for testing
      List<int> testBytes = [];

      // Initialize printer
      testBytes.addAll([0x1B, 0x40]); // ESC @ - Initialize

      // Print test text
      testBytes.addAll('HELLO WORLD\n'.codeUnits);
      testBytes.addAll('TEST PRINT\n'.codeUnits);
      testBytes.addAll('FROM FLUTTER\n'.codeUnits);

      // Feed and cut
      testBytes.addAll([0x1B, 0x64, 0x03]); // ESC d 3 - Feed 3 lines
      testBytes.addAll([0x1D, 0x56, 0x42, 0x00]); // GS V B 0 - Cut paper

      debugPrint('Sending ${testBytes.length} test bytes');

      await _flutterThermalPrinter.printData(
        printer,
        testBytes,
        longData: false,
      );

      debugPrint('Test print completed');
    } catch (e) {
      debugPrint('Test print error: $e');
      rethrow;
    }
  }

  Future<void> printImage(
    BuildContext context,
    Widget widget,
    Printer printer,
  ) async {
    final isBle = printer.connectionType == ConnectionType.BLE;
    debugPrint(
      'Printing to ${printer.name} via ${isBle ? "BLE" : "USB"} using printWidget',
    );

    await _flutterThermalPrinter.printWidget(
      context,
      printer: printer,
      widget: widget,
    );

    debugPrint('Print job sent successfully via printWidget');
  }

  Future<Widget> _applyPhotoFilters(Widget originalWidget) async {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: 384, // 58mm paper width in dots
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 0.32,
              alignment: Alignment.topLeft,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.difference,
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.saturation,
                  ),
                  child: originalWidget,
                ),
              ),
            ),
          ],
        ),
      ),
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
