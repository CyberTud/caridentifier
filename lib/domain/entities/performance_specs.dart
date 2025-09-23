import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'performance_specs.freezed.dart';
part 'performance_specs.g.dart';

@freezed
@HiveType(typeId: 6)
class PerformanceSpecs with _$PerformanceSpecs {
  const factory PerformanceSpecs({
    @HiveField(0) required String horsepower,
    @HiveField(1) required String torque,
    @HiveField(2) @JsonKey(name: 'zero_to_sixty') required String zeroToSixty,
    @HiveField(3) @JsonKey(name: 'top_speed') required String topSpeed,
    @HiveField(4) @JsonKey(name: 'fuel_economy') required String fuelEconomy,
  }) = _PerformanceSpecs;

  factory PerformanceSpecs.fromJson(Map<String, dynamic> json) =>
      _$PerformanceSpecsFromJson(json);
}