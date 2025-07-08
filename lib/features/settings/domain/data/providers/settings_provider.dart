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
    final cameraOrientation = prefs.getString('camera_orientation') ?? 'front';

    state = state.copyWith(
      selectedPrinter: selectedPrinter,
      cameraOrientation: cameraOrientation,
    );
  }

  Future<void> setSelectedPrinter(String? printerName) async {
    final prefs = await SharedPreferences.getInstance();

    if (printerName != null) {
      await prefs.setString('selected_printer', printerName);
    } else {
      await prefs.remove('selected_printer');
    }

    state = state.copyWith(selectedPrinter: printerName);
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
