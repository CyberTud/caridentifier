import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/car_analysis.dart';
import '../../presentation/screens/capture_screen.dart';
import '../../presentation/screens/analysis_screen.dart';
import '../../presentation/screens/results_screen.dart';
import '../../presentation/screens/recents_screen.dart';
import '../../presentation/screens/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'capture',
        builder: (context, state) => const CaptureScreen(),
      ),
      GoRoute(
        path: '/analysis',
        name: 'analysis',
        builder: (context, state) {
          final imagePath = state.uri.queryParameters['imagePath'];
          final hint = state.uri.queryParameters['hint'];

          if (imagePath == null) {
            return const CaptureScreen();
          }

          return AnalysisScreen(
            imagePath: imagePath,
            hint: hint,
          );
        },
      ),
      GoRoute(
        path: '/results',
        name: 'results',
        builder: (context, state) {
          final analysis = state.extra as CarAnalysis?;

          if (analysis == null) {
            return const CaptureScreen();
          }

          return ResultsScreen(analysis: analysis);
        },
      ),
      GoRoute(
        path: '/recents',
        name: 'recents',
        builder: (context, state) => const RecentsScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => const CaptureScreen(),
  );
});