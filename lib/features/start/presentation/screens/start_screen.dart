import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle start button press
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
