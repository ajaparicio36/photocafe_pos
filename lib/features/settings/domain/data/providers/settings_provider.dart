import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photocafe_pos/features/settings/domain/data/models/settings_state.dart';

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final selectedPrinter = prefs.getString('selected_printer');
    final selectedPrinterAddress = prefs.getString('selected_printer_address');
    final cameraOrientation = prefs.getString('camera_orientation') ?? 'front';

    state = state.copyWith(
      selectedPrinter: selectedPrinter,
      selectedPrinterAddress: selectedPrinterAddress,
      cameraOrientation: cameraOrientation,
    );
  }

  Future<void> setSelectedPrinter({
    String? printerName,
    String? printerAddress,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (printerName != null) {
      await prefs.setString('selected_printer', printerName);
    } else {
      await prefs.remove('selected_printer');
    }

    if (printerAddress != null) {
      await prefs.setString('selected_printer_address', printerAddress);
    } else {
      await prefs.remove('selected_printer_address');
    }

    state = state.copyWith(
      selectedPrinter: printerName,
      selectedPrinterAddress: printerAddress,
    );
  }

  Future<void> setCameraOrientation(String orientation) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('camera_orientation', orientation);

    state = state.copyWith(cameraOrientation: orientation);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(),
);
