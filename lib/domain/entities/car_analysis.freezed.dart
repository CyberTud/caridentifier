// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarAnalysis _$CarAnalysisFromJson(Map<String, dynamic> json) {
  return _CarAnalysis.fromJson(json);
}

/// @nodoc
mixin _$CarAnalysis {
  @HiveField(0)
  String get make => throw _privateConstructorUsedError;
  @HiveField(1)
  String get model => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get generation => throw _privateConstructorUsedError;
  @HiveField(3)
  String get yearRange => throw _privateConstructorUsedError;
  @HiveField(4)
  String get bodyStyle => throw _privateConstructorUsedError;
  @HiveField(5)
  List<TrimCandidate> get trimCandidates => throw _privateConstructorUsedError;
  @HiveField(6)
  double get confidence => throw _privateConstructorUsedError;
  @HiveField(7)
  KeySpecs get keySpecs => throw _privateConstructorUsedError;
  @HiveField(8)
  PerformanceSpecs get performanceSpecs => throw _privateConstructorUsedError;
  @HiveField(9)
  PriceEstimates get priceEstimates => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String> get notableHistory => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String> get maintenanceTips => throw _privateConstructorUsedError;
  @HiveField(12)
  List<SimilarModel> get similarModels => throw _privateConstructorUsedError;
  @HiveField(13)
  String get disclaimer => throw _privateConstructorUsedError;
  @HiveField(14)
  String get imageLocalPath => throw _privateConstructorUsedError;
  @HiveField(15)
  String get id => throw _privateConstructorUsedError;
  @HiveField(16)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarAnalysisCopyWith<CarAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarAnalysisCopyWith<$Res> {
  factory $CarAnalysisCopyWith(
          CarAnalysis value, $Res Function(CarAnalysis) then) =
      _$CarAnalysisCopyWithImpl<$Res, CarAnalysis>;
  @useResult
  $Res call(
      {@HiveField(0) String make,
      @HiveField(1) String model,
      @HiveField(2) String? generation,
      @HiveField(3) String yearRange,
      @HiveField(4) String bodyStyle,
      @HiveField(5) List<TrimCandidate> trimCandidates,
      @HiveField(6) double confidence,
      @HiveField(7) KeySpecs keySpecs,
      @HiveField(8) PerformanceSpecs performanceSpecs,
      @HiveField(9) PriceEstimates priceEstimates,
      @HiveField(10) List<String> notableHistory,
      @HiveField(11) List<String> maintenanceTips,
      @HiveField(12) List<SimilarModel> similarModels,
      @HiveField(13) String disclaimer,
      @HiveField(14) String imageLocalPath,
      @HiveField(15) String id,
      @HiveField(16) DateTime createdAt});

  $KeySpecsCopyWith<$Res> get keySpecs;
  $PerformanceSpecsCopyWith<$Res> get performanceSpecs;
  $PriceEstimatesCopyWith<$Res> get priceEstimates;
}

/// @nodoc
class _$CarAnalysisCopyWithImpl<$Res, $Val extends CarAnalysis>
    implements $CarAnalysisCopyWith<$Res> {
  _$CarAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? make = null,
    Object? model = null,
    Object? generation = freezed,
    Object? yearRange = null,
    Object? bodyStyle = null,
    Object? trimCandidates = null,
    Object? confidence = null,
    Object? keySpecs = null,
    Object? performanceSpecs = null,
    Object? priceEstimates = null,
    Object? notableHistory = null,
    Object? maintenanceTips = null,
    Object? similarModels = null,
    Object? disclaimer = null,
    Object? imageLocalPath = null,
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
      yearRange: null == yearRange
          ? _value.yearRange
          : yearRange // ignore: cast_nullable_to_non_nullable
              as String,
      bodyStyle: null == bodyStyle
          ? _value.bodyStyle
          : bodyStyle // ignore: cast_nullable_to_non_nullable
              as String,
      trimCandidates: null == trimCandidates
          ? _value.trimCandidates
          : trimCandidates // ignore: cast_nullable_to_non_nullable
              as List<TrimCandidate>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      keySpecs: null == keySpecs
          ? _value.keySpecs
          : keySpecs // ignore: cast_nullable_to_non_nullable
              as KeySpecs,
      performanceSpecs: null == performanceSpecs
          ? _value.performanceSpecs
          : performanceSpecs // ignore: cast_nullable_to_non_nullable
              as PerformanceSpecs,
      priceEstimates: null == priceEstimates
          ? _value.priceEstimates
          : priceEstimates // ignore: cast_nullable_to_non_nullable
              as PriceEstimates,
      notableHistory: null == notableHistory
          ? _value.notableHistory
          : notableHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maintenanceTips: null == maintenanceTips
          ? _value.maintenanceTips
          : maintenanceTips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      similarModels: null == similarModels
          ? _value.similarModels
          : similarModels // ignore: cast_nullable_to_non_nullable
              as List<SimilarModel>,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      imageLocalPath: null == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KeySpecsCopyWith<$Res> get keySpecs {
    return $KeySpecsCopyWith<$Res>(_value.keySpecs, (value) {
      return _then(_value.copyWith(keySpecs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PerformanceSpecsCopyWith<$Res> get performanceSpecs {
    return $PerformanceSpecsCopyWith<$Res>(_value.performanceSpecs, (value) {
      return _then(_value.copyWith(performanceSpecs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceEstimatesCopyWith<$Res> get priceEstimates {
    return $PriceEstimatesCopyWith<$Res>(_value.priceEstimates, (value) {
      return _then(_value.copyWith(priceEstimates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CarAnalysisImplCopyWith<$Res>
    implements $CarAnalysisCopyWith<$Res> {
  factory _$$CarAnalysisImplCopyWith(
          _$CarAnalysisImpl value, $Res Function(_$CarAnalysisImpl) then) =
      __$$CarAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String make,
      @HiveField(1) String model,
      @HiveField(2) String? generation,
      @HiveField(3) String yearRange,
      @HiveField(4) String bodyStyle,
      @HiveField(5) List<TrimCandidate> trimCandidates,
      @HiveField(6) double confidence,
      @HiveField(7) KeySpecs keySpecs,
      @HiveField(8) PerformanceSpecs performanceSpecs,
      @HiveField(9) PriceEstimates priceEstimates,
      @HiveField(10) List<String> notableHistory,
      @HiveField(11) List<String> maintenanceTips,
      @HiveField(12) List<SimilarModel> similarModels,
      @HiveField(13) String disclaimer,
      @HiveField(14) String imageLocalPath,
      @HiveField(15) String id,
      @HiveField(16) DateTime createdAt});

  @override
  $KeySpecsCopyWith<$Res> get keySpecs;
  @override
  $PerformanceSpecsCopyWith<$Res> get performanceSpecs;
  @override
  $PriceEstimatesCopyWith<$Res> get priceEstimates;
}

/// @nodoc
class __$$CarAnalysisImplCopyWithImpl<$Res>
    extends _$CarAnalysisCopyWithImpl<$Res, _$CarAnalysisImpl>
    implements _$$CarAnalysisImplCopyWith<$Res> {
  __$$CarAnalysisImplCopyWithImpl(
      _$CarAnalysisImpl _value, $Res Function(_$CarAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? make = null,
    Object? model = null,
    Object? generation = freezed,
    Object? yearRange = null,
    Object? bodyStyle = null,
    Object? trimCandidates = null,
    Object? confidence = null,
    Object? keySpecs = null,
    Object? performanceSpecs = null,
    Object? priceEstimates = null,
    Object? notableHistory = null,
    Object? maintenanceTips = null,
    Object? similarModels = null,
    Object? disclaimer = null,
    Object? imageLocalPath = null,
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_$CarAnalysisImpl(
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
      yearRange: null == yearRange
          ? _value.yearRange
          : yearRange // ignore: cast_nullable_to_non_nullable
              as String,
      bodyStyle: null == bodyStyle
          ? _value.bodyStyle
          : bodyStyle // ignore: cast_nullable_to_non_nullable
              as String,
      trimCandidates: null == trimCandidates
          ? _value._trimCandidates
          : trimCandidates // ignore: cast_nullable_to_non_nullable
              as List<TrimCandidate>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      keySpecs: null == keySpecs
          ? _value.keySpecs
          : keySpecs // ignore: cast_nullable_to_non_nullable
              as KeySpecs,
      performanceSpecs: null == performanceSpecs
          ? _value.performanceSpecs
          : performanceSpecs // ignore: cast_nullable_to_non_nullable
              as PerformanceSpecs,
      priceEstimates: null == priceEstimates
          ? _value.priceEstimates
          : priceEstimates // ignore: cast_nullable_to_non_nullable
              as PriceEstimates,
      notableHistory: null == notableHistory
          ? _value._notableHistory
          : notableHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maintenanceTips: null == maintenanceTips
          ? _value._maintenanceTips
          : maintenanceTips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      similarModels: null == similarModels
          ? _value._similarModels
          : similarModels // ignore: cast_nullable_to_non_nullable
              as List<SimilarModel>,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      imageLocalPath: null == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarAnalysisImpl implements _CarAnalysis {
  const _$CarAnalysisImpl(
      {@HiveField(0) required this.make,
      @HiveField(1) required this.model,
      @HiveField(2) this.generation,
      @HiveField(3) required this.yearRange,
      @HiveField(4) required this.bodyStyle,
      @HiveField(5) required final List<TrimCandidate> trimCandidates,
      @HiveField(6) required this.confidence,
      @HiveField(7) required this.keySpecs,
      @HiveField(8) required this.performanceSpecs,
      @HiveField(9) required this.priceEstimates,
      @HiveField(10) required final List<String> notableHistory,
      @HiveField(11) required final List<String> maintenanceTips,
      @HiveField(12) required final List<SimilarModel> similarModels,
      @HiveField(13) required this.disclaimer,
      @HiveField(14) required this.imageLocalPath,
      @HiveField(15) this.id = '',
      @HiveField(16) required this.createdAt})
      : _trimCandidates = trimCandidates,
        _notableHistory = notableHistory,
        _maintenanceTips = maintenanceTips,
        _similarModels = similarModels;

  factory _$CarAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarAnalysisImplFromJson(json);

  @override
  @HiveField(0)
  final String make;
  @override
  @HiveField(1)
  final String model;
  @override
  @HiveField(2)
  final String? generation;
  @override
  @HiveField(3)
  final String yearRange;
  @override
  @HiveField(4)
  final String bodyStyle;
  final List<TrimCandidate> _trimCandidates;
  @override
  @HiveField(5)
  List<TrimCandidate> get trimCandidates {
    if (_trimCandidates is EqualUnmodifiableListView) return _trimCandidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trimCandidates);
  }

  @override
  @HiveField(6)
  final double confidence;
  @override
  @HiveField(7)
  final KeySpecs keySpecs;
  @override
  @HiveField(8)
  final PerformanceSpecs performanceSpecs;
  @override
  @HiveField(9)
  final PriceEstimates priceEstimates;
  final List<String> _notableHistory;
  @override
  @HiveField(10)
  List<String> get notableHistory {
    if (_notableHistory is EqualUnmodifiableListView) return _notableHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notableHistory);
  }

  final List<String> _maintenanceTips;
  @override
  @HiveField(11)
  List<String> get maintenanceTips {
    if (_maintenanceTips is EqualUnmodifiableListView) return _maintenanceTips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maintenanceTips);
  }

  final List<SimilarModel> _similarModels;
  @override
  @HiveField(12)
  List<SimilarModel> get similarModels {
    if (_similarModels is EqualUnmodifiableListView) return _similarModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarModels);
  }

  @override
  @HiveField(13)
  final String disclaimer;
  @override
  @HiveField(14)
  final String imageLocalPath;
  @override
  @JsonKey()
  @HiveField(15)
  final String id;
  @override
  @HiveField(16)
  final DateTime createdAt;

  @override
  String toString() {
    return 'CarAnalysis(make: $make, model: $model, generation: $generation, yearRange: $yearRange, bodyStyle: $bodyStyle, trimCandidates: $trimCandidates, confidence: $confidence, keySpecs: $keySpecs, performanceSpecs: $performanceSpecs, priceEstimates: $priceEstimates, notableHistory: $notableHistory, maintenanceTips: $maintenanceTips, similarModels: $similarModels, disclaimer: $disclaimer, imageLocalPath: $imageLocalPath, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarAnalysisImpl &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.yearRange, yearRange) ||
                other.yearRange == yearRange) &&
            (identical(other.bodyStyle, bodyStyle) ||
                other.bodyStyle == bodyStyle) &&
            const DeepCollectionEquality()
                .equals(other._trimCandidates, _trimCandidates) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.keySpecs, keySpecs) ||
                other.keySpecs == keySpecs) &&
            (identical(other.performanceSpecs, performanceSpecs) ||
                other.performanceSpecs == performanceSpecs) &&
            (identical(other.priceEstimates, priceEstimates) ||
                other.priceEstimates == priceEstimates) &&
            const DeepCollectionEquality()
                .equals(other._notableHistory, _notableHistory) &&
            const DeepCollectionEquality()
                .equals(other._maintenanceTips, _maintenanceTips) &&
            const DeepCollectionEquality()
                .equals(other._similarModels, _similarModels) &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer) &&
            (identical(other.imageLocalPath, imageLocalPath) ||
                other.imageLocalPath == imageLocalPath) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      make,
      model,
      generation,
      yearRange,
      bodyStyle,
      const DeepCollectionEquality().hash(_trimCandidates),
      confidence,
      keySpecs,
      performanceSpecs,
      priceEstimates,
      const DeepCollectionEquality().hash(_notableHistory),
      const DeepCollectionEquality().hash(_maintenanceTips),
      const DeepCollectionEquality().hash(_similarModels),
      disclaimer,
      imageLocalPath,
      id,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarAnalysisImplCopyWith<_$CarAnalysisImpl> get copyWith =>
      __$$CarAnalysisImplCopyWithImpl<_$CarAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarAnalysisImplToJson(
      this,
    );
  }
}

abstract class _CarAnalysis implements CarAnalysis {
  const factory _CarAnalysis(
      {@HiveField(0) required final String make,
      @HiveField(1) required final String model,
      @HiveField(2) final String? generation,
      @HiveField(3) required final String yearRange,
      @HiveField(4) required final String bodyStyle,
      @HiveField(5) required final List<TrimCandidate> trimCandidates,
      @HiveField(6) required final double confidence,
      @HiveField(7) required final KeySpecs keySpecs,
      @HiveField(8) required final PerformanceSpecs performanceSpecs,
      @HiveField(9) required final PriceEstimates priceEstimates,
      @HiveField(10) required final List<String> notableHistory,
      @HiveField(11) required final List<String> maintenanceTips,
      @HiveField(12) required final List<SimilarModel> similarModels,
      @HiveField(13) required final String disclaimer,
      @HiveField(14) required final String imageLocalPath,
      @HiveField(15) final String id,
      @HiveField(16) required final DateTime createdAt}) = _$CarAnalysisImpl;

  factory _CarAnalysis.fromJson(Map<String, dynamic> json) =
      _$CarAnalysisImpl.fromJson;

  @override
  @HiveField(0)
  String get make;
  @override
  @HiveField(1)
  String get model;
  @override
  @HiveField(2)
  String? get generation;
  @override
  @HiveField(3)
  String get yearRange;
  @override
  @HiveField(4)
  String get bodyStyle;
  @override
  @HiveField(5)
  List<TrimCandidate> get trimCandidates;
  @override
  @HiveField(6)
  double get confidence;
  @override
  @HiveField(7)
  KeySpecs get keySpecs;
  @override
  @HiveField(8)
  PerformanceSpecs get performanceSpecs;
  @override
  @HiveField(9)
  PriceEstimates get priceEstimates;
  @override
  @HiveField(10)
  List<String> get notableHistory;
  @override
  @HiveField(11)
  List<String> get maintenanceTips;
  @override
  @HiveField(12)
  List<SimilarModel> get similarModels;
  @override
  @HiveField(13)
  String get disclaimer;
  @override
  @HiveField(14)
  String get imageLocalPath;
  @override
  @HiveField(15)
  String get id;
  @override
  @HiveField(16)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CarAnalysisImplCopyWith<_$CarAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
