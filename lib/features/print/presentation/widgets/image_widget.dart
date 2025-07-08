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
      width: width ?? 384, // Standard thermal printer width
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              'PHOTOCAFE POS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const Divider(color: Colors.black, thickness: 2),

          const SizedBox(height: 8),

          // Image
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.2126, 0.7152, 0.0722, 0, 0, // Red channel
                0.2126, 0.7152, 0.0722, 0, 0, // Green channel
                0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
                0, 0, 0, 1, 0, // Alpha channel
              ]),
              child: Image.file(
                File(imagePath),
                width: 320,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Footer
          const Divider(color: Colors.black, thickness: 1),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Text(
                  'Printed on ${_formatDate(DateTime.now())}',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Thank you for visiting PhotoCafe!',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
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
