import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/capture_state.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/image_model.dart';

class CaptureNotifier extends Notifier<CaptureState> {
  @override
  CaptureState build() {
    return CaptureState();
  }

  void captureImage(String imagePath) {
    final image = ImageModel(imagePath: imagePath, capturedAt: DateTime.now());
    state = state.copyWith(image: image, isLoading: false);
  }

  void applyFilter(String filterPath) {
    state = state.copyWith(filterPath: filterPath, isLoading: false);
  }

  void reset() {
    state = state.copyWith(image: null, isLoading: false);
  }
}
