import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/car_analysis.dart';
import '../../domain/repositories/car_analysis_repository.dart';
import '../../infrastructure/repositories/car_analysis_repository_impl.dart';
import '../../infrastructure/services/vision_api.dart';
import 'settings_provider.dart';

final analysisBoxProvider = Provider<Box<CarAnalysis>>((ref) {
  throw UnimplementedError('Analysis box not initialized');
});

final visionApiProvider = Provider<VisionApi>((ref) {
  final settings = ref.watch(settingsProvider);

  if (settings.mockMode) {
    return MockVisionApi();
  }

  return OpenAIVisionApi(
    baseUrl: settings.backendUrl,
    dio: Dio(),
  );
});

final carAnalysisRepositoryProvider = Provider<CarAnalysisRepository>((ref) {
  final visionApi = ref.watch(visionApiProvider);
  final analysisBox = ref.watch(analysisBoxProvider);

  return CarAnalysisRepositoryImpl(
    visionApi: visionApi,
    analysisBox: analysisBox,
  );
});

final recentAnalysesProvider = StreamProvider<List<CarAnalysis>>((ref) {
  final repository = ref.watch(carAnalysisRepositoryProvider);
  return repository.watchRecentAnalyses();
});