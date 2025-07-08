import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/capture_state.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_notifier.dart';

final captureProvider = NotifierProvider<CaptureNotifier, CaptureState>(() {
  return CaptureNotifier();
});
