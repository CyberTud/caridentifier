// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trim_candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrimCandidate _$TrimCandidateFromJson(Map<String, dynamic> json) {
  return _TrimCandidate.fromJson(json);
}

/// @nodoc
mixin _$TrimCandidate {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  double get confidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrimCandidateCopyWith<TrimCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrimCandidateCopyWith<$Res> {
  factory $TrimCandidateCopyWith(
          TrimCandidate value, $Res Function(TrimCandidate) then) =
      _$TrimCandidateCopyWithImpl<$Res, TrimCandidate>;
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) double confidence});
}

/// @nodoc
class _$TrimCandidateCopyWithImpl<$Res, $Val extends TrimCandidate>
    implements $TrimCandidateCopyWith<$Res> {
  _$TrimCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrimCandidateImplCopyWith<$Res>
    implements $TrimCandidateCopyWith<$Res> {
  factory _$$TrimCandidateImplCopyWith(
          _$TrimCandidateImpl value, $Res Function(_$TrimCandidateImpl) then) =
      __$$TrimCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) double confidence});
}

/// @nodoc
class __$$TrimCandidateImplCopyWithImpl<$Res>
    extends _$TrimCandidateCopyWithImpl<$Res, _$TrimCandidateImpl>
    implements _$$TrimCandidateImplCopyWith<$Res> {
  __$$TrimCandidateImplCopyWithImpl(
      _$TrimCandidateImpl _value, $Res Function(_$TrimCandidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? confidence = null,
  }) {
    return _then(_$TrimCandidateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrimCandidateImpl implements _TrimCandidate {
  const _$TrimCandidateImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.confidence});

  factory _$TrimCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrimCandidateImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final double confidence;

  @override
  String toString() {
    return 'TrimCandidate(name: $name, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrimCandidateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrimCandidateImplCopyWith<_$TrimCandidateImpl> get copyWith =>
      __$$TrimCandidateImplCopyWithImpl<_$TrimCandidateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrimCandidateImplToJson(
      this,
    );
  }
}

abstract class _TrimCandidate implements TrimCandidate {
  const factory _TrimCandidate(
      {@HiveField(0) required final String name,
      @HiveField(1) required final double confidence}) = _$TrimCandidateImpl;

  factory _TrimCandidate.fromJson(Map<String, dynamic> json) =
      _$TrimCandidateImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  double get confidence;
  @override
  @JsonKey(ignore: true)
  _$$TrimCandidateImplCopyWith<_$TrimCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
