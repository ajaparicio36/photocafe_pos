import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrintScreen extends ConsumerWidget {
  const PrintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Print')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle print button press
          },
          child: const Text('Print Document'),
        ),
      ),
    );
  }
}
