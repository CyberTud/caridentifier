// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimilarModelAdapter extends TypeAdapter<SimilarModel> {
  @override
  final int typeId = 3;

  @override
  SimilarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SimilarModel(
      name: fields[0] as String,
      why: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SimilarModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.why);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimilarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimilarModelImpl _$$SimilarModelImplFromJson(Map<String, dynamic> json) =>
    _$SimilarModelImpl(
      name: json['name'] as String,
      why: json['why'] as String,
    );

Map<String, dynamic> _$$SimilarModelImplToJson(_$SimilarModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'why': instance.why,
    };
