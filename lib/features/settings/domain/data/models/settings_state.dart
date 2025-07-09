import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    String? selectedPrinter,
    String? selectedPrinterAddress,
    @Default('front') String cameraOrientation,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);
}
