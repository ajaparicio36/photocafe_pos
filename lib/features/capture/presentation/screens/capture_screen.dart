import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaptureScreen extends ConsumerWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle capture button press
          },
          child: const Text('Capture Image'),
        ),
      ),
    );
  }
}
