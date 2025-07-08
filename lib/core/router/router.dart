import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/presentation/screens/capture_screen.dart';
import 'package:photocafe_pos/features/print/presentation/screens/print_screen.dart';
import 'package:photocafe_pos/features/start/presentation/screens/start_screen.dart';
import 'package:photocafe_pos/features/settings/presentation/screens/settings_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const StartScreen()),
    GoRoute(
      path: '/capture',
      builder: (context, state) => const CaptureScreen(),
    ),
    GoRoute(path: '/print', builder: (context, state) => const PrintScreen()),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
