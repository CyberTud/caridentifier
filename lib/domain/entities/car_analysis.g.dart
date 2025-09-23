// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_analysis.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAnalysisAdapter extends TypeAdapter<CarAnalysis> {
  @override
  final int typeId = 0;

  @override
  CarAnalysis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarAnalysis(
      make: fields[0] as String,
      model: fields[1] as String,
      generation: fields[2] as String?,
      yearRange: fields[3] as String,
      bodyStyle: fields[4] as String,
      trimCandidates: (fields[5] as List).cast<TrimCandidate>(),
      confidence: fields[6] as double,
      keySpecs: fields[7] as KeySpecs,
      performanceSpecs: fields[8] as PerformanceSpecs,
      priceEstimates: fields[9] as PriceEstimates,
      notableHistory: (fields[10] as List).cast<String>(),
      maintenanceTips: (fields[11] as List).cast<String>(),
      similarModels: (fields[12] as List).cast<SimilarModel>(),
      disclaimer: fields[13] as String,
      imageLocalPath: fields[14] as String,
      id: fields[15] as String,
      createdAt: fields[16] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CarAnalysis obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.make)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.generation)
      ..writeByte(3)
      ..write(obj.yearRange)
      ..writeByte(4)
      ..write(obj.bodyStyle)
      ..writeByte(5)
      ..write(obj.trimCandidates)
      ..writeByte(6)
      ..write(obj.confidence)
      ..writeByte(7)
      ..write(obj.keySpecs)
      ..writeByte(8)
      ..write(obj.performanceSpecs)
      ..writeByte(9)
      ..write(obj.priceEstimates)
      ..writeByte(10)
      ..write(obj.notableHistory)
      ..writeByte(11)
      ..write(obj.maintenanceTips)
      ..writeByte(12)
      ..write(obj.similarModels)
      ..writeByte(13)
      ..write(obj.disclaimer)
      ..writeByte(14)
      ..write(obj.imageLocalPath)
      ..writeByte(15)
      ..write(obj.id)
      ..writeByte(16)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAnalysisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarAnalysisImpl _$$CarAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$CarAnalysisImpl(
      make: json['make'] as String,
      model: json['model'] as String,
      generation: json['generation'] as String?,
      yearRange: json['yearRange'] as String,
      bodyStyle: json['bodyStyle'] as String,
      trimCandidates: (json['trimCandidates'] as List<dynamic>)
          .map((e) => TrimCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
      keySpecs: KeySpecs.fromJson(json['keySpecs'] as Map<String, dynamic>),
      performanceSpecs: PerformanceSpecs.fromJson(
          json['performanceSpecs'] as Map<String, dynamic>),
      priceEstimates: PriceEstimates.fromJson(
          json['priceEstimates'] as Map<String, dynamic>),
      notableHistory: (json['notableHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      maintenanceTips: (json['maintenanceTips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      similarModels: (json['similarModels'] as List<dynamic>)
          .map((e) => SimilarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      disclaimer: json['disclaimer'] as String,
      imageLocalPath: json['imageLocalPath'] as String,
      id: json['id'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CarAnalysisImplToJson(_$CarAnalysisImpl instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'yearRange': instance.yearRange,
      'bodyStyle': instance.bodyStyle,
      'trimCandidates': instance.trimCandidates,
      'confidence': instance.confidence,
      'keySpecs': instance.keySpecs,
      'performanceSpecs': instance.performanceSpecs,
      'priceEstimates': instance.priceEstimates,
      'notableHistory': instance.notableHistory,
      'maintenanceTips': instance.maintenanceTips,
      'similarModels': instance.similarModels,
      'disclaimer': instance.disclaimer,
      'imageLocalPath': instance.imageLocalPath,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };
