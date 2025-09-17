// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trim_candidate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrimCandidateAdapter extends TypeAdapter<TrimCandidate> {
  @override
  final int typeId = 1;

  @override
  TrimCandidate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrimCandidate(
      name: fields[0] as String,
      confidence: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TrimCandidate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.confidence);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrimCandidateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrimCandidateImpl _$$TrimCandidateImplFromJson(Map<String, dynamic> json) =>
    _$TrimCandidateImpl(
      name: json['name'] as String,
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$TrimCandidateImplToJson(_$TrimCandidateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'confidence': instance.confidence,
    };
