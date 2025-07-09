import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/print/domain/data/providers/print_notifier.dart';
import 'package:photocafe_pos/features/settings/domain/data/models/settings_state.dart';
import 'package:photocafe_pos/features/settings/domain/data/providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final printerState = ref.watch(printProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Printer Settings
            Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Printer Settings',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          onPressed: () => ref
                              .read(printProvider.notifier)
                              .refreshPrinters(),
                          icon: const Icon(Icons.refresh),
                          tooltip: 'Refresh Printers',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildPrinterSelector(
                      context,
                      ref,
                      settingsState,
                      printerState,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Camera Settings
            Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Camera Settings',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    _buildCameraOrientationSelector(
                      context,
                      ref,
                      settingsState,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrinterSelector(
    BuildContext context,
    WidgetRef ref,
    SettingsState settingsState,
    AsyncValue printerState,
  ) {
    return printerState.when(
      data: (state) {
        if (state.connectedPrinters.isEmpty) {
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
                Text(
                  'No printers found',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: state.connectedPrinters.map<Widget>((printer) {
            final isSelected =
                settingsState.selectedPrinterAddress == printer.address;
            return ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : null,
                size: 20,
              ),
              title: Text(
                printer.name ?? 'Unknown Printer',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                '${printer.address ?? 'Unknown Address'} • ${printer.connectionType.toString().split('.').last}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                ref
                    .read(settingsProvider.notifier)
                    .setSelectedPrinter(
                      printerName: printer.name,
                      printerAddress: printer.address,
                    );
              },
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.onErrorContainer,
              size: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Error: $error',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraOrientationSelector(
    BuildContext context,
    WidgetRef ref,
    SettingsState settingsState,
  ) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: Icon(
            settingsState.cameraOrientation == 'front'
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: settingsState.cameraOrientation == 'front'
                ? Theme.of(context).colorScheme.primary
                : null,
            size: 20,
          ),
          title: Text(
            'Front Camera',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Default camera orientation',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            ref.read(settingsProvider.notifier).setCameraOrientation('front');
          },
        ),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: Icon(
            settingsState.cameraOrientation == 'back'
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: settingsState.cameraOrientation == 'back'
                ? Theme.of(context).colorScheme.primary
                : null,
            size: 20,
          ),
          title: Text(
            'Back Camera',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Rear camera orientation',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            ref.read(settingsProvider.notifier).setCameraOrientation('back');
          },
        ),
      ],
    );
  }
}
