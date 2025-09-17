import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'price_estimates.freezed.dart';
part 'price_estimates.g.dart';

@freezed
@HiveType(typeId: 5)
class PriceEstimates with _$PriceEstimates {
  const factory PriceEstimates({
    @HiveField(0) required String newMsrp,
    @HiveField(1) required String usedFair,
    @HiveField(2) required String usedGood,
    @HiveField(3) required String usedExcellent,
    @HiveField(4) required String marketInsights,
  }) = _PriceEstimates;

  factory PriceEstimates.fromJson(Map<String, dynamic> json) =>
      _$PriceEstimatesFromJson(json);
}