import 'package:image_picker/image_picker.dart';
import '../entities/car_analysis.dart';

abstract class CarAnalysisRepository {
  Future<CarAnalysis> analyzeImage({
    required XFile image,
    String? hint,
  });

  Future<void> saveAnalysis(CarAnalysis analysis);

  Future<List<CarAnalysis>> getRecentAnalyses();

  Future<void> deleteAnalysis(String id);

  Future<void> clearAllAnalyses();

  Stream<List<CarAnalysis>> watchRecentAnalyses();
}