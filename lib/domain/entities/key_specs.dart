import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'key_specs.freezed.dart';
part 'key_specs.g.dart';

@freezed
@HiveType(typeId: 2)
class KeySpecs with _$KeySpecs {
  const factory KeySpecs({
    @HiveField(0) required List<String> engineOptions,
    @HiveField(1) required List<String> drivetrain,
    @HiveField(2) required List<String> transmission,
  }) = _KeySpecs;

  factory KeySpecs.fromJson(Map<String, dynamic> json) =>
      _$KeySpecsFromJson(json);
}