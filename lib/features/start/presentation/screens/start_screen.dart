import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_providers.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header section
              Expanded(flex: 2, child: _buildHeader(context)),

              // Main content
              Expanded(flex: 3, child: _buildMainContent(context)),

              // Action section
              Expanded(flex: 2, child: _buildActionSection(context, ref)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo/Brand section
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 4,
            ),
          ),
          child: Icon(
            Icons.photo_camera,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 24),

        // App title
        Text(
          'PHOTOCAFE',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'POS SYSTEM',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            letterSpacing: 2,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome message
            Text(
              'Welcome to',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'PhotoCafe',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // Divider
            Container(
              width: 80,
              height: 2,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 24),

            // Description
            Text(
              'Create memories with our\nclassic photobooth experience',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.5),
            ),

            const SizedBox(height: 16),

            // Features
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFeatureItem(context, Icons.camera_alt, 'Capture'),
                _buildFeatureItem(context, Icons.print, 'Print'),
                _buildFeatureItem(context, Icons.favorite, 'Enjoy'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildActionSection(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Instructions
        Container(
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
                  'Press start to begin your photobooth session',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Start button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _handleStartSession(context, ref),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.play_arrow, size: 28),
                const SizedBox(width: 12),
                Text(
                  'START SESSION',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Footer
        Text(
          'Touch to start • Classic photobooth experience',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  void _handleStartSession(BuildContext context, WidgetRef ref) {
    // Clear capture state before starting new session
    ref.read(captureProvider.notifier).reset();

    // Navigate to capture screen
    context.go('/capture');
  }
}
