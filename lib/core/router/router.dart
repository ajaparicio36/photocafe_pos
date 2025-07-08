import 'package:go_router/go_router.dart';
import 'package:photocafe_pos/features/capture/presentation/screens/capture_screen.dart';
import 'package:photocafe_pos/features/print/presentation/screens/apply_filter_screen.dart';
import 'package:photocafe_pos/features/print/presentation/screens/print_screen.dart';
import 'package:photocafe_pos/features/start/presentation/screens/start_screen.dart';
import 'package:photocafe_pos/features/start/presentation/screens/thank_you_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const StartScreen();
      },
    ),

    GoRoute(
      path: '/capture',
      builder: (context, state) {
        return const CaptureScreen();
      },
    ),

    GoRoute(
      path: '/apply-filter',
      builder: (context, state) {
        return const ApplyFilterScreen();
      },
    ),

    GoRoute(
      path: '/print',
      builder: (context, state) {
        return const PrintScreen();
      },
    ),

    GoRoute(
      path: '/thank-you',
      builder: (context, state) {
        return const ThankYouScreen();
      },
    ),
  ],
);
