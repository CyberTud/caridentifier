import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'trim_candidate.freezed.dart';
part 'trim_candidate.g.dart';

@freezed
@HiveType(typeId: 1)
class TrimCandidate with _$TrimCandidate {
  const factory TrimCandidate({
    @HiveField(0) required String name,
    @HiveField(1) required double confidence,
  }) = _TrimCandidate;

  factory TrimCandidate.fromJson(Map<String, dynamic> json) =>
      _$TrimCandidateFromJson(json);
}