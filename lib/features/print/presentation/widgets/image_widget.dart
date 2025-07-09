import 'dart:io';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const ImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4), // Slightly more padding
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // Align to start
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: const Text(
              'PHOTOCAFE POS',
              style: TextStyle(
                fontSize: 12, // Bigger font
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Image - bigger size
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                // More subtle grayscale conversion for better detail
                0.299, 0.587, 0.114, 0, 30, // Red - reduced brightness offset
                0.299, 0.587, 0.114, 0, 30, // Green - reduced brightness offset
                0.299, 0.587, 0.114, 0, 30, // Blue - reduced brightness offset
                0, 0, 0, 1, 0, // Alpha
              ]),
              child: Image.file(
                File(imagePath),
                width: 120,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 2),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Align to start
              children: [
                Text(
                  'Printed on ${_formatDate(DateTime.now())}',
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.black,
                  ), // Bigger font
                ),
                const SizedBox(height: 1),
                const Text(
                  'Thank you for visiting PhotoCafe!',
                  style: TextStyle(
                    fontSize: 8, // Bigger font
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year} at '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
