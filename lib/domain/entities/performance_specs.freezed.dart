// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_specs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PerformanceSpecs _$PerformanceSpecsFromJson(Map<String, dynamic> json) {
  return _PerformanceSpecs.fromJson(json);
}

/// @nodoc
mixin _$PerformanceSpecs {
  @HiveField(0)
  String get horsepower => throw _privateConstructorUsedError;
  @HiveField(1)
  String get torque => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'zero_to_sixty')
  String get zeroToSixty => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'top_speed')
  String get topSpeed => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'fuel_economy')
  String get fuelEconomy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceSpecsCopyWith<PerformanceSpecs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceSpecsCopyWith<$Res> {
  factory $PerformanceSpecsCopyWith(
          PerformanceSpecs value, $Res Function(PerformanceSpecs) then) =
      _$PerformanceSpecsCopyWithImpl<$Res, PerformanceSpecs>;
  @useResult
  $Res call(
      {@HiveField(0) String horsepower,
      @HiveField(1) String torque,
      @HiveField(2) @JsonKey(name: 'zero_to_sixty') String zeroToSixty,
      @HiveField(3) @JsonKey(name: 'top_speed') String topSpeed,
      @HiveField(4) @JsonKey(name: 'fuel_economy') String fuelEconomy});
}

/// @nodoc
class _$PerformanceSpecsCopyWithImpl<$Res, $Val extends PerformanceSpecs>
    implements $PerformanceSpecsCopyWith<$Res> {
  _$PerformanceSpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? horsepower = null,
    Object? torque = null,
    Object? zeroToSixty = null,
    Object? topSpeed = null,
    Object? fuelEconomy = null,
  }) {
    return _then(_value.copyWith(
      horsepower: null == horsepower
          ? _value.horsepower
          : horsepower // ignore: cast_nullable_to_non_nullable
              as String,
      torque: null == torque
          ? _value.torque
          : torque // ignore: cast_nullable_to_non_nullable
              as String,
      zeroToSixty: null == zeroToSixty
          ? _value.zeroToSixty
          : zeroToSixty // ignore: cast_nullable_to_non_nullable
              as String,
      topSpeed: null == topSpeed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      fuelEconomy: null == fuelEconomy
          ? _value.fuelEconomy
          : fuelEconomy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceSpecsImplCopyWith<$Res>
    implements $PerformanceSpecsCopyWith<$Res> {
  factory _$$PerformanceSpecsImplCopyWith(_$PerformanceSpecsImpl value,
          $Res Function(_$PerformanceSpecsImpl) then) =
      __$$PerformanceSpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String horsepower,
      @HiveField(1) String torque,
      @HiveField(2) @JsonKey(name: 'zero_to_sixty') String zeroToSixty,
      @HiveField(3) @JsonKey(name: 'top_speed') String topSpeed,
      @HiveField(4) @JsonKey(name: 'fuel_economy') String fuelEconomy});
}

/// @nodoc
class __$$PerformanceSpecsImplCopyWithImpl<$Res>
    extends _$PerformanceSpecsCopyWithImpl<$Res, _$PerformanceSpecsImpl>
    implements _$$PerformanceSpecsImplCopyWith<$Res> {
  __$$PerformanceSpecsImplCopyWithImpl(_$PerformanceSpecsImpl _value,
      $Res Function(_$PerformanceSpecsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? horsepower = null,
    Object? torque = null,
    Object? zeroToSixty = null,
    Object? topSpeed = null,
    Object? fuelEconomy = null,
  }) {
    return _then(_$PerformanceSpecsImpl(
      horsepower: null == horsepower
          ? _value.horsepower
          : horsepower // ignore: cast_nullable_to_non_nullable
              as String,
      torque: null == torque
          ? _value.torque
          : torque // ignore: cast_nullable_to_non_nullable
              as String,
      zeroToSixty: null == zeroToSixty
          ? _value.zeroToSixty
          : zeroToSixty // ignore: cast_nullable_to_non_nullable
              as String,
      topSpeed: null == topSpeed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      fuelEconomy: null == fuelEconomy
          ? _value.fuelEconomy
          : fuelEconomy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceSpecsImpl implements _PerformanceSpecs {
  const _$PerformanceSpecsImpl(
      {@HiveField(0) required this.horsepower,
      @HiveField(1) required this.torque,
      @HiveField(2) @JsonKey(name: 'zero_to_sixty') required this.zeroToSixty,
      @HiveField(3) @JsonKey(name: 'top_speed') required this.topSpeed,
      @HiveField(4) @JsonKey(name: 'fuel_economy') required this.fuelEconomy});

  factory _$PerformanceSpecsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceSpecsImplFromJson(json);

  @override
  @HiveField(0)
  final String horsepower;
  @override
  @HiveField(1)
  final String torque;
  @override
  @HiveField(2)
  @JsonKey(name: 'zero_to_sixty')
  final String zeroToSixty;
  @override
  @HiveField(3)
  @JsonKey(name: 'top_speed')
  final String topSpeed;
  @override
  @HiveField(4)
  @JsonKey(name: 'fuel_economy')
  final String fuelEconomy;

  @override
  String toString() {
    return 'PerformanceSpecs(horsepower: $horsepower, torque: $torque, zeroToSixty: $zeroToSixty, topSpeed: $topSpeed, fuelEconomy: $fuelEconomy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSpecsImpl &&
            (identical(other.horsepower, horsepower) ||
                other.horsepower == horsepower) &&
            (identical(other.torque, torque) || other.torque == torque) &&
            (identical(other.zeroToSixty, zeroToSixty) ||
                other.zeroToSixty == zeroToSixty) &&
            (identical(other.topSpeed, topSpeed) ||
                other.topSpeed == topSpeed) &&
            (identical(other.fuelEconomy, fuelEconomy) ||
                other.fuelEconomy == fuelEconomy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, horsepower, torque, zeroToSixty, topSpeed, fuelEconomy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceSpecsImplCopyWith<_$PerformanceSpecsImpl> get copyWith =>
      __$$PerformanceSpecsImplCopyWithImpl<_$PerformanceSpecsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceSpecsImplToJson(
      this,
    );
  }
}

abstract class _PerformanceSpecs implements PerformanceSpecs {
  const factory _PerformanceSpecs(
      {@HiveField(0) required final String horsepower,
      @HiveField(1) required final String torque,
      @HiveField(2)
      @JsonKey(name: 'zero_to_sixty')
      required final String zeroToSixty,
      @HiveField(3) @JsonKey(name: 'top_speed') required final String topSpeed,
      @HiveField(4)
      @JsonKey(name: 'fuel_economy')
      required final String fuelEconomy}) = _$PerformanceSpecsImpl;

  factory _PerformanceSpecs.fromJson(Map<String, dynamic> json) =
      _$PerformanceSpecsImpl.fromJson;

  @override
  @HiveField(0)
  String get horsepower;
  @override
  @HiveField(1)
  String get torque;
  @override
  @HiveField(2)
  @JsonKey(name: 'zero_to_sixty')
  String get zeroToSixty;
  @override
  @HiveField(3)
  @JsonKey(name: 'top_speed')
  String get topSpeed;
  @override
  @HiveField(4)
  @JsonKey(name: 'fuel_economy')
  String get fuelEconomy;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceSpecsImplCopyWith<_$PerformanceSpecsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
