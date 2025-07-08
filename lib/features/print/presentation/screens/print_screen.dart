import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_providers.dart';
import 'package:photocafe_pos/features/print/domain/data/providers/print_notifier.dart';
import 'package:photocafe_pos/features/print/presentation/widgets/image_widget.dart';

class PrintScreen extends ConsumerStatefulWidget {
  const PrintScreen({super.key});

  @override
  ConsumerState<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends ConsumerState<PrintScreen> {
  bool _isPrinting = false;

  @override
  Widget build(BuildContext context) {
    final captureState = ref.watch(captureProvider);
    final printerState = ref.watch(printProvider);

    // If no image captured, redirect back
    if (captureState.image == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/capture');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Print Photo',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () => context.go('/capture'),
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
            // Preview section
            Expanded(
              child: _buildPreviewSection(
                context,
                captureState.image!.imagePath,
              ),
            ),

            const SizedBox(height: 24),

            // Printer status
            _buildPrinterStatus(context, printerState),

            const SizedBox(height: 16),

            // Action buttons
            _buildActionButtons(
              context,
              captureState.image!.imagePath,
              printerState,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewSection(BuildContext context, String imagePath) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Print Preview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 16),

            // Preview container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(22.4),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Transform.scale(
                      scale: 0.8,
                      child: ImageWidget(imagePath: imagePath),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This is how your photo will be printed (grayscale)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
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

  Widget _buildPrinterStatus(BuildContext context, AsyncValue printerState) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(22.4),
      ),
      child: Row(
        children: [
          Icon(
            printerState.when(
              data: (state) => state.connectedPrinters.isNotEmpty
                  ? Icons.print
                  : Icons.print_disabled,
              loading: () => Icons.search,
              error: (_, __) => Icons.error,
            ),
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              printerState.when(
                data: (state) => state.connectedPrinters.isNotEmpty
                    ? '${state.connectedPrinters.length} printer(s) available'
                    : 'No printers found',
                loading: () => 'Searching for printers...',
                error: (error, _) => 'Error: $error',
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    String imagePath,
    AsyncValue printerState,
  ) {
    return Row(
      children: [
        // Retake button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _isPrinting
                ? null
                : () {
                    ref.read(captureProvider.notifier).reset();
                    context.go('/capture');
                  },
            icon: const Icon(Icons.camera_alt),
            label: const Text('Retake'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Print button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _isPrinting
                ? null
                : () => _handlePrint(context, imagePath, printerState),
            icon: _isPrinting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.print),
            label: Text(_isPrinting ? 'Printing...' : 'Print'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handlePrint(
    BuildContext context,
    String imagePath,
    AsyncValue printerState,
  ) async {
    final state = printerState.value;
    if (state?.connectedPrinters.isEmpty ?? true) {
      _showMessage(context, 'No printers available');
      return;
    }

    setState(() => _isPrinting = true);

    try {
      final printer = state!.connectedPrinters.first;
      final printWidget = ImageWidget(imagePath: imagePath);

      await ref
          .read(printProvider.notifier)
          .printImage(context, printWidget, printer);

      if (mounted) {
        _showMessage(context, 'Print job sent successfully!');

        // Navigate to thank you screen after successful print
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            context.go('/thank-you');
          }
        });
      }
    } catch (e) {
      if (mounted) {
        _showMessage(context, 'Print failed: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isPrinting = false);
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.4),
        ),
      ),
    );
  }
}
