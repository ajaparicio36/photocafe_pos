import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/image_model.dart';

part 'capture_state.freezed.dart';
part 'capture_state.g.dart';

@freezed
sealed class CaptureState with _$CaptureState {
  const factory CaptureState({
    ImageModel? image,
    String? framePath,
    @Default(true) bool hasRetake,
    @Default(false) bool isLoading,
    String? error,
  }) = _CaptureState;

  factory CaptureState.fromJson(Map<String, dynamic> json) =>
      _$CaptureStateFromJson(json);
}
