import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/domain/data/models/capture_state.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_notifier.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_providers.dart';
import 'package:photocafe_pos/features/capture/presentation/widgets/camera_widget.dart';

class CaptureScreen extends ConsumerWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captureState = ref.watch(captureProvider);
    final captureNotifier = ref.read(captureProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Capture Photo',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: captureState.image == null
                  ? _buildCameraView(context, captureNotifier)
                  : _buildPreviewView(context, captureState, captureNotifier),
            ),

            const SizedBox(height: 24),

            // Bottom actions
            _buildBottomActions(context, captureState, captureNotifier),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView(BuildContext context, CaptureNotifier notifier) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: CameraWidget(
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
      elevation: 8,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Preview header
            Text(
              'Photo Preview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 16),

            // Image preview
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.4),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.4),
                  child: Image.file(
                    File(state.image!.imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Capture info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(22.4),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.schedule,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Captured at ${_formatTime(state.image!.capturedAt)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(22.4),
        ),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Position yourself and tap the capture button',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
              icon: const Icon(Icons.refresh),
              label: const Text('Retake'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],

        // Continue button
        Expanded(
          flex: state.hasRetake ? 1 : 2,
          child: ElevatedButton.icon(
            onPressed: () {
              context.go('/print');
            },
            icon: const Icon(Icons.print),
            label: const Text('Print Photo'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
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
