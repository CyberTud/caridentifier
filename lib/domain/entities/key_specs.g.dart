// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_specs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeySpecsAdapter extends TypeAdapter<KeySpecs> {
  @override
  final int typeId = 2;

  @override
  KeySpecs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KeySpecs(
      engineOptions: (fields[0] as List).cast<String>(),
      drivetrain: (fields[1] as List).cast<String>(),
      transmission: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, KeySpecs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.engineOptions)
      ..writeByte(1)
      ..write(obj.drivetrain)
      ..writeByte(2)
      ..write(obj.transmission);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeySpecsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeySpecsImpl _$$KeySpecsImplFromJson(Map<String, dynamic> json) =>
    _$KeySpecsImpl(
      engineOptions: (json['engineOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      drivetrain: (json['drivetrain'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      transmission: (json['transmission'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$KeySpecsImplToJson(_$KeySpecsImpl instance) =>
    <String, dynamic>{
      'engineOptions': instance.engineOptions,
      'drivetrain': instance.drivetrain,
      'transmission': instance.transmission,
    };
