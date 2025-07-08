import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/capture_state.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_notifier.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_providers.dart';
import 'package:photocafe_pos/features/capture/presentation/widgets/camera_widget.dart';
import 'package:photocafe_pos/features/settings/domain/data/models/settings_state.dart';
import 'package:photocafe_pos/features/settings/domain/data/providers/settings_provider.dart';

class CaptureScreen extends ConsumerWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captureState = ref.watch(captureProvider);
    final captureNotifier = ref.read(captureProvider.notifier);
    final settingsState = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Capture Photo',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: captureState.image == null
                  ? _buildCameraView(context, captureNotifier, settingsState)
                  : _buildPreviewView(context, captureState, captureNotifier),
            ),

            const SizedBox(height: 16),

            // Bottom actions
            _buildBottomActions(context, captureState, captureNotifier),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView(
    BuildContext context,
    CaptureNotifier notifier,
    SettingsState settingsState,
  ) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: CameraWidget(
          cameraOrientation: settingsState.cameraOrientation,
          onImageCaptured: () {
            // This will be handled by the camera widget internally
            // The image path will be passed to the notifier
          },
        ),
      ),
    );
  }

  Widget _buildPreviewView(
    BuildContext context,
    CaptureState state,
    CaptureNotifier notifier,
  ) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Preview header
            Text(
              'Photo Preview',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            // Image preview
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.file(
                    File(state.image!.imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Capture info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Captured at ${_formatTime(state.image!.capturedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions(
    BuildContext context,
    CaptureState state,
    CaptureNotifier notifier,
  ) {
    if (state.image == null) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Position yourself and tap the capture button',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        // Retake button (only if hasRetake is true)
        if (state.hasRetake) ...[
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                notifier.retakeImage();
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Retake'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],

        // Continue button
        Expanded(
          flex: state.hasRetake ? 1 : 2,
          child: ElevatedButton.icon(
            onPressed: () {
              context.go('/print');
            },
            icon: const Icon(Icons.print, size: 18),
            label: const Text('Print Photo'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
  }
}
