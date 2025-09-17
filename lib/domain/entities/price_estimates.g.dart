// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_estimates.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceEstimatesAdapter extends TypeAdapter<PriceEstimates> {
  @override
  final int typeId = 5;

  @override
  PriceEstimates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceEstimates(
      newMsrp: fields[0] as String,
      usedFair: fields[1] as String,
      usedGood: fields[2] as String,
      usedExcellent: fields[3] as String,
      marketInsights: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PriceEstimates obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.newMsrp)
      ..writeByte(1)
      ..write(obj.usedFair)
      ..writeByte(2)
      ..write(obj.usedGood)
      ..writeByte(3)
      ..write(obj.usedExcellent)
      ..writeByte(4)
      ..write(obj.marketInsights);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceEstimatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceEstimatesImpl _$$PriceEstimatesImplFromJson(Map<String, dynamic> json) =>
    _$PriceEstimatesImpl(
      newMsrp: json['newMsrp'] as String,
      usedFair: json['usedFair'] as String,
      usedGood: json['usedGood'] as String,
      usedExcellent: json['usedExcellent'] as String,
      marketInsights: json['marketInsights'] as String,
    );

Map<String, dynamic> _$$PriceEstimatesImplToJson(
        _$PriceEstimatesImpl instance) =>
    <String, dynamic>{
      'newMsrp': instance.newMsrp,
      'usedFair': instance.usedFair,
      'usedGood': instance.usedGood,
      'usedExcellent': instance.usedExcellent,
      'marketInsights': instance.marketInsights,
    };
