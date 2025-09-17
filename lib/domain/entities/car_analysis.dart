import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'trim_candidate.dart';
import 'key_specs.dart';
import 'price_estimates.dart';
import 'similar_model.dart';

part 'car_analysis.freezed.dart';
part 'car_analysis.g.dart';

@freezed
@HiveType(typeId: 0)
class CarAnalysis with _$CarAnalysis {
  const factory CarAnalysis({
    @HiveField(0) required String make,
    @HiveField(1) required String model,
    @HiveField(2) String? generation,
    @HiveField(3) required String yearRange,
    @HiveField(4) required String bodyStyle,
    @HiveField(5) required List<TrimCandidate> trimCandidates,
    @HiveField(6) required double confidence,
    @HiveField(7) required KeySpecs keySpecs,
    @HiveField(8) required PriceEstimates priceEstimates,
    @HiveField(9) required List<String> notableHistory,
    @HiveField(10) required List<String> maintenanceTips,
    @HiveField(11) required List<SimilarModel> similarModels,
    @HiveField(12) required String disclaimer,
    @HiveField(13) required String imageLocalPath,
    @HiveField(14) @Default('') String id,
    @HiveField(15) required DateTime createdAt,
  }) = _CarAnalysis;

  factory CarAnalysis.fromJson(Map<String, dynamic> json) =>
      _$CarAnalysisFromJson(json);
}