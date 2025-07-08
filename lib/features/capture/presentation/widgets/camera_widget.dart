import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photocafe_pos/features/capture/domain/data/providers/capture_providers.dart';

class CameraWidget extends ConsumerStatefulWidget {
  final VoidCallback? onImageCaptured;
  final String cameraOrientation;

  const CameraWidget({
    super.key,
    this.onImageCaptured,
    this.cameraOrientation = 'front',
  });

  @override
  ConsumerState<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends ConsumerState<CameraWidget> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isCapturing = false;
  int _countdown = 0;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void didUpdateWidget(CameraWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cameraOrientation != widget.cameraOrientation) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    // Request camera permission
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return;
    }

    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        // Select camera based on orientation preference
        CameraDescription selectedCamera =
            _cameras![0]; // Default to first camera

        if (widget.cameraOrientation == 'front') {
          // Look for front camera
          final frontCameras = _cameras!.where(
            (camera) => camera.lensDirection == CameraLensDirection.front,
          );
          if (frontCameras.isNotEmpty) {
            selectedCamera = frontCameras.first;
          }
        } else {
          // Look for back camera
          final backCameras = _cameras!.where(
            (camera) => camera.lensDirection == CameraLensDirection.back,
          );
          if (backCameras.isNotEmpty) {
            selectedCamera = backCameras.first;
          }
        }

        _controller?.dispose();
        _controller = CameraController(
          selectedCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _startCountdownAndCapture() async {
    if (_isCapturing || _controller == null) return;

    setState(() {
      _isCapturing = true;
      _countdown = 5;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _countdown--;
      });

      if (_countdown <= 0) {
        timer.cancel();
        _captureImage();
      }
    });
  }

  Future<void> _captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath =
          '${directory.path}/capture_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final XFile image = await _controller!.takePicture();
      await image.saveTo(imagePath);

      if (mounted) {
        // Save to capture state
        ref.read(captureProvider.notifier).captureImage(imagePath);

        setState(() {
          _isCapturing = false;
          _countdown = 0;
        });

        widget.onImageCaptured?.call();
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
      setState(() {
        _isCapturing = false;
        _countdown = 0;
      });
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized || _controller == null) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      children: [
        // Camera preview
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: CameraPreview(_controller!),
          ),
        ),

        // Countdown overlay
        if (_countdown > 0)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$_countdown',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

        // Capture button
        if (!_isCapturing)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _startCountdownAndCapture,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 3,
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
