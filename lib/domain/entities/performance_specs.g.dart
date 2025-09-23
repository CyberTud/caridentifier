// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_specs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformanceSpecsAdapter extends TypeAdapter<PerformanceSpecs> {
  @override
  final int typeId = 6;

  @override
  PerformanceSpecs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PerformanceSpecs(
      horsepower: fields[0] as String,
      torque: fields[1] as String,
      zeroToSixty: fields[2] as String,
      topSpeed: fields[3] as String,
      fuelEconomy: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PerformanceSpecs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.horsepower)
      ..writeByte(1)
      ..write(obj.torque)
      ..writeByte(2)
      ..write(obj.zeroToSixty)
      ..writeByte(3)
      ..write(obj.topSpeed)
      ..writeByte(4)
      ..write(obj.fuelEconomy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformanceSpecsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceSpecsImpl _$$PerformanceSpecsImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceSpecsImpl(
      horsepower: json['horsepower'] as String,
      torque: json['torque'] as String,
      zeroToSixty: json['zero_to_sixty'] as String,
      topSpeed: json['top_speed'] as String,
      fuelEconomy: json['fuel_economy'] as String,
    );

Map<String, dynamic> _$$PerformanceSpecsImplToJson(
        _$PerformanceSpecsImpl instance) =>
    <String, dynamic>{
      'horsepower': instance.horsepower,
      'torque': instance.torque,
      'zero_to_sixty': instance.zeroToSixty,
      'top_speed': instance.topSpeed,
      'fuel_economy': instance.fuelEconomy,
    };
