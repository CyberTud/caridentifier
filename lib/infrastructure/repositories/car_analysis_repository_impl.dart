import 'dart:async';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/car_analysis.dart';
import '../../domain/repositories/car_analysis_repository.dart';
import '../services/vision_api.dart';

class CarAnalysisRepositoryImpl implements CarAnalysisRepository {
  final VisionApi _visionApi;
  final Box<CarAnalysis> _analysisBox;
  final StreamController<List<CarAnalysis>> _analysesController;
  final Uuid _uuid = const Uuid();

  CarAnalysisRepositoryImpl({
    required VisionApi visionApi,
    required Box<CarAnalysis> analysisBox,
  })  : _visionApi = visionApi,
        _analysisBox = analysisBox,
        _analysesController = StreamController<List<CarAnalysis>>.broadcast();

  @override
  Future<CarAnalysis> analyzeImage({
    required XFile image,
    String? hint,
  }) async {
    final analysis = await _visionApi.analyze(image: image, hint: hint);

    // Generate a unique ID and save to cache
    final analysisWithId = analysis.copyWith(
      id: _uuid.v4(),
      createdAt: DateTime.now(),
    );

    await saveAnalysis(analysisWithId);
    return analysisWithId;
  }

  @override
  Future<void> saveAnalysis(CarAnalysis analysis) async {
    await _analysisBox.put(analysis.id, analysis);
    _notifyListeners();
  }

  @override
  Future<List<CarAnalysis>> getRecentAnalyses() async {
    final analyses = _analysisBox.values.toList();
    analyses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return analyses;
  }

  @override
  Future<void> deleteAnalysis(String id) async {
    await _analysisBox.delete(id);
    _notifyListeners();
  }

  @override
  Future<void> clearAllAnalyses() async {
    await _analysisBox.clear();
    _notifyListeners();
  }

  @override
  Stream<List<CarAnalysis>> watchRecentAnalyses() {
    // Emit initial data
    getRecentAnalyses().then((analyses) {
      if (!_analysesController.isClosed) {
        _analysesController.add(analyses);
      }
    });

    return _analysesController.stream;
  }

  void _notifyListeners() {
    getRecentAnalyses().then((analyses) {
      if (!_analysesController.isClosed) {
        _analysesController.add(analyses);
      }
    });
  }

  void dispose() {
    _analysesController.close();
  }
}