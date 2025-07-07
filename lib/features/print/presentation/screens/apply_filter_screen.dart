import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplyFilterScreen extends ConsumerWidget {
  const ApplyFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Filter')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle apply filter button press
          },
          child: const Text('Apply Filter'),
        ),
      ),
    );
  }
}
