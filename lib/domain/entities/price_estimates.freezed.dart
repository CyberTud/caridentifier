// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_estimates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceEstimates _$PriceEstimatesFromJson(Map<String, dynamic> json) {
  return _PriceEstimates.fromJson(json);
}

/// @nodoc
mixin _$PriceEstimates {
  @HiveField(0)
  String get newMsrp => throw _privateConstructorUsedError;
  @HiveField(1)
  String get usedFair => throw _privateConstructorUsedError;
  @HiveField(2)
  String get usedGood => throw _privateConstructorUsedError;
  @HiveField(3)
  String get usedExcellent => throw _privateConstructorUsedError;
  @HiveField(4)
  String get marketInsights => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceEstimatesCopyWith<PriceEstimates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceEstimatesCopyWith<$Res> {
  factory $PriceEstimatesCopyWith(
          PriceEstimates value, $Res Function(PriceEstimates) then) =
      _$PriceEstimatesCopyWithImpl<$Res, PriceEstimates>;
  @useResult
  $Res call(
      {@HiveField(0) String newMsrp,
      @HiveField(1) String usedFair,
      @HiveField(2) String usedGood,
      @HiveField(3) String usedExcellent,
      @HiveField(4) String marketInsights});
}

/// @nodoc
class _$PriceEstimatesCopyWithImpl<$Res, $Val extends PriceEstimates>
    implements $PriceEstimatesCopyWith<$Res> {
  _$PriceEstimatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMsrp = null,
    Object? usedFair = null,
    Object? usedGood = null,
    Object? usedExcellent = null,
    Object? marketInsights = null,
  }) {
    return _then(_value.copyWith(
      newMsrp: null == newMsrp
          ? _value.newMsrp
          : newMsrp // ignore: cast_nullable_to_non_nullable
              as String,
      usedFair: null == usedFair
          ? _value.usedFair
          : usedFair // ignore: cast_nullable_to_non_nullable
              as String,
      usedGood: null == usedGood
          ? _value.usedGood
          : usedGood // ignore: cast_nullable_to_non_nullable
              as String,
      usedExcellent: null == usedExcellent
          ? _value.usedExcellent
          : usedExcellent // ignore: cast_nullable_to_non_nullable
              as String,
      marketInsights: null == marketInsights
          ? _value.marketInsights
          : marketInsights // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceEstimatesImplCopyWith<$Res>
    implements $PriceEstimatesCopyWith<$Res> {
  factory _$$PriceEstimatesImplCopyWith(_$PriceEstimatesImpl value,
          $Res Function(_$PriceEstimatesImpl) then) =
      __$$PriceEstimatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String newMsrp,
      @HiveField(1) String usedFair,
      @HiveField(2) String usedGood,
      @HiveField(3) String usedExcellent,
      @HiveField(4) String marketInsights});
}

/// @nodoc
class __$$PriceEstimatesImplCopyWithImpl<$Res>
    extends _$PriceEstimatesCopyWithImpl<$Res, _$PriceEstimatesImpl>
    implements _$$PriceEstimatesImplCopyWith<$Res> {
  __$$PriceEstimatesImplCopyWithImpl(
      _$PriceEstimatesImpl _value, $Res Function(_$PriceEstimatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMsrp = null,
    Object? usedFair = null,
    Object? usedGood = null,
    Object? usedExcellent = null,
    Object? marketInsights = null,
  }) {
    return _then(_$PriceEstimatesImpl(
      newMsrp: null == newMsrp
          ? _value.newMsrp
          : newMsrp // ignore: cast_nullable_to_non_nullable
              as String,
      usedFair: null == usedFair
          ? _value.usedFair
          : usedFair // ignore: cast_nullable_to_non_nullable
              as String,
      usedGood: null == usedGood
          ? _value.usedGood
          : usedGood // ignore: cast_nullable_to_non_nullable
              as String,
      usedExcellent: null == usedExcellent
          ? _value.usedExcellent
          : usedExcellent // ignore: cast_nullable_to_non_nullable
              as String,
      marketInsights: null == marketInsights
          ? _value.marketInsights
          : marketInsights // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceEstimatesImpl implements _PriceEstimates {
  const _$PriceEstimatesImpl(
      {@HiveField(0) required this.newMsrp,
      @HiveField(1) required this.usedFair,
      @HiveField(2) required this.usedGood,
      @HiveField(3) required this.usedExcellent,
      @HiveField(4) required this.marketInsights});

  factory _$PriceEstimatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceEstimatesImplFromJson(json);

  @override
  @HiveField(0)
  final String newMsrp;
  @override
  @HiveField(1)
  final String usedFair;
  @override
  @HiveField(2)
  final String usedGood;
  @override
  @HiveField(3)
  final String usedExcellent;
  @override
  @HiveField(4)
  final String marketInsights;

  @override
  String toString() {
    return 'PriceEstimates(newMsrp: $newMsrp, usedFair: $usedFair, usedGood: $usedGood, usedExcellent: $usedExcellent, marketInsights: $marketInsights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceEstimatesImpl &&
            (identical(other.newMsrp, newMsrp) || other.newMsrp == newMsrp) &&
            (identical(other.usedFair, usedFair) ||
                other.usedFair == usedFair) &&
            (identical(other.usedGood, usedGood) ||
                other.usedGood == usedGood) &&
            (identical(other.usedExcellent, usedExcellent) ||
                other.usedExcellent == usedExcellent) &&
            (identical(other.marketInsights, marketInsights) ||
                other.marketInsights == marketInsights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, newMsrp, usedFair, usedGood, usedExcellent, marketInsights);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceEstimatesImplCopyWith<_$PriceEstimatesImpl> get copyWith =>
      __$$PriceEstimatesImplCopyWithImpl<_$PriceEstimatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceEstimatesImplToJson(
      this,
    );
  }
}

abstract class _PriceEstimates implements PriceEstimates {
  const factory _PriceEstimates(
          {@HiveField(0) required final String newMsrp,
          @HiveField(1) required final String usedFair,
          @HiveField(2) required final String usedGood,
          @HiveField(3) required final String usedExcellent,
          @HiveField(4) required final String marketInsights}) =
      _$PriceEstimatesImpl;

  factory _PriceEstimates.fromJson(Map<String, dynamic> json) =
      _$PriceEstimatesImpl.fromJson;

  @override
  @HiveField(0)
  String get newMsrp;
  @override
  @HiveField(1)
  String get usedFair;
  @override
  @HiveField(2)
  String get usedGood;
  @override
  @HiveField(3)
  String get usedExcellent;
  @override
  @HiveField(4)
  String get marketInsights;
  @override
  @JsonKey(ignore: true)
  _$$PriceEstimatesImplCopyWith<_$PriceEstimatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
