// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_specs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KeySpecs _$KeySpecsFromJson(Map<String, dynamic> json) {
  return _KeySpecs.fromJson(json);
}

/// @nodoc
mixin _$KeySpecs {
  @HiveField(0)
  List<String> get engineOptions => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String> get drivetrain => throw _privateConstructorUsedError;
  @HiveField(2)
  List<String> get transmission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeySpecsCopyWith<KeySpecs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeySpecsCopyWith<$Res> {
  factory $KeySpecsCopyWith(KeySpecs value, $Res Function(KeySpecs) then) =
      _$KeySpecsCopyWithImpl<$Res, KeySpecs>;
  @useResult
  $Res call(
      {@HiveField(0) List<String> engineOptions,
      @HiveField(1) List<String> drivetrain,
      @HiveField(2) List<String> transmission});
}

/// @nodoc
class _$KeySpecsCopyWithImpl<$Res, $Val extends KeySpecs>
    implements $KeySpecsCopyWith<$Res> {
  _$KeySpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engineOptions = null,
    Object? drivetrain = null,
    Object? transmission = null,
  }) {
    return _then(_value.copyWith(
      engineOptions: null == engineOptions
          ? _value.engineOptions
          : engineOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      drivetrain: null == drivetrain
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeySpecsImplCopyWith<$Res>
    implements $KeySpecsCopyWith<$Res> {
  factory _$$KeySpecsImplCopyWith(
          _$KeySpecsImpl value, $Res Function(_$KeySpecsImpl) then) =
      __$$KeySpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String> engineOptions,
      @HiveField(1) List<String> drivetrain,
      @HiveField(2) List<String> transmission});
}

/// @nodoc
class __$$KeySpecsImplCopyWithImpl<$Res>
    extends _$KeySpecsCopyWithImpl<$Res, _$KeySpecsImpl>
    implements _$$KeySpecsImplCopyWith<$Res> {
  __$$KeySpecsImplCopyWithImpl(
      _$KeySpecsImpl _value, $Res Function(_$KeySpecsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engineOptions = null,
    Object? drivetrain = null,
    Object? transmission = null,
  }) {
    return _then(_$KeySpecsImpl(
      engineOptions: null == engineOptions
          ? _value._engineOptions
          : engineOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      drivetrain: null == drivetrain
          ? _value._drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transmission: null == transmission
          ? _value._transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeySpecsImpl implements _KeySpecs {
  const _$KeySpecsImpl(
      {@HiveField(0) required final List<String> engineOptions,
      @HiveField(1) required final List<String> drivetrain,
      @HiveField(2) required final List<String> transmission})
      : _engineOptions = engineOptions,
        _drivetrain = drivetrain,
        _transmission = transmission;

  factory _$KeySpecsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeySpecsImplFromJson(json);

  final List<String> _engineOptions;
  @override
  @HiveField(0)
  List<String> get engineOptions {
    if (_engineOptions is EqualUnmodifiableListView) return _engineOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_engineOptions);
  }

  final List<String> _drivetrain;
  @override
  @HiveField(1)
  List<String> get drivetrain {
    if (_drivetrain is EqualUnmodifiableListView) return _drivetrain;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drivetrain);
  }

  final List<String> _transmission;
  @override
  @HiveField(2)
  List<String> get transmission {
    if (_transmission is EqualUnmodifiableListView) return _transmission;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transmission);
  }

  @override
  String toString() {
    return 'KeySpecs(engineOptions: $engineOptions, drivetrain: $drivetrain, transmission: $transmission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeySpecsImpl &&
            const DeepCollectionEquality()
                .equals(other._engineOptions, _engineOptions) &&
            const DeepCollectionEquality()
                .equals(other._drivetrain, _drivetrain) &&
            const DeepCollectionEquality()
                .equals(other._transmission, _transmission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_engineOptions),
      const DeepCollectionEquality().hash(_drivetrain),
      const DeepCollectionEquality().hash(_transmission));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeySpecsImplCopyWith<_$KeySpecsImpl> get copyWith =>
      __$$KeySpecsImplCopyWithImpl<_$KeySpecsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeySpecsImplToJson(
      this,
    );
  }
}

abstract class _KeySpecs implements KeySpecs {
  const factory _KeySpecs(
      {@HiveField(0) required final List<String> engineOptions,
      @HiveField(1) required final List<String> drivetrain,
      @HiveField(2) required final List<String> transmission}) = _$KeySpecsImpl;

  factory _KeySpecs.fromJson(Map<String, dynamic> json) =
      _$KeySpecsImpl.fromJson;

  @override
  @HiveField(0)
  List<String> get engineOptions;
  @override
  @HiveField(1)
  List<String> get drivetrain;
  @override
  @HiveField(2)
  List<String> get transmission;
  @override
  @JsonKey(ignore: true)
  _$$KeySpecsImplCopyWith<_$KeySpecsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
