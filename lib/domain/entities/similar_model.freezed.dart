// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimilarModel _$SimilarModelFromJson(Map<String, dynamic> json) {
  return _SimilarModel.fromJson(json);
}

/// @nodoc
mixin _$SimilarModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get why => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimilarModelCopyWith<SimilarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimilarModelCopyWith<$Res> {
  factory $SimilarModelCopyWith(
          SimilarModel value, $Res Function(SimilarModel) then) =
      _$SimilarModelCopyWithImpl<$Res, SimilarModel>;
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) String why});
}

/// @nodoc
class _$SimilarModelCopyWithImpl<$Res, $Val extends SimilarModel>
    implements $SimilarModelCopyWith<$Res> {
  _$SimilarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? why = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimilarModelImplCopyWith<$Res>
    implements $SimilarModelCopyWith<$Res> {
  factory _$$SimilarModelImplCopyWith(
          _$SimilarModelImpl value, $Res Function(_$SimilarModelImpl) then) =
      __$$SimilarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) String why});
}

/// @nodoc
class __$$SimilarModelImplCopyWithImpl<$Res>
    extends _$SimilarModelCopyWithImpl<$Res, _$SimilarModelImpl>
    implements _$$SimilarModelImplCopyWith<$Res> {
  __$$SimilarModelImplCopyWithImpl(
      _$SimilarModelImpl _value, $Res Function(_$SimilarModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? why = null,
  }) {
    return _then(_$SimilarModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimilarModelImpl implements _SimilarModel {
  const _$SimilarModelImpl(
      {@HiveField(0) required this.name, @HiveField(1) required this.why});

  factory _$SimilarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimilarModelImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String why;

  @override
  String toString() {
    return 'SimilarModel(name: $name, why: $why)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimilarModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.why, why) || other.why == why));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, why);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimilarModelImplCopyWith<_$SimilarModelImpl> get copyWith =>
      __$$SimilarModelImplCopyWithImpl<_$SimilarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimilarModelImplToJson(
      this,
    );
  }
}

abstract class _SimilarModel implements SimilarModel {
  const factory _SimilarModel(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String why}) = _$SimilarModelImpl;

  factory _SimilarModel.fromJson(Map<String, dynamic> json) =
      _$SimilarModelImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get why;
  @override
  @JsonKey(ignore: true)
  _$$SimilarModelImplCopyWith<_$SimilarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
