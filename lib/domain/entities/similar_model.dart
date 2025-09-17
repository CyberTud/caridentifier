import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'similar_model.freezed.dart';
part 'similar_model.g.dart';

@freezed
@HiveType(typeId: 3)
class SimilarModel with _$SimilarModel {
  const factory SimilarModel({
    @HiveField(0) required String name,
    @HiveField(1) required String why,
  }) = _SimilarModel;

  factory SimilarModel.fromJson(Map<String, dynamic> json) =>
      _$SimilarModelFromJson(json);
}