// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_time_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TravelTimeResult {
  int get durationMinutes => throw _privateConstructorUsedError;
  String get distanceText => throw _privateConstructorUsedError;
  int get distanceMeters => throw _privateConstructorUsedError;

  /// Create a copy of TravelTimeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelTimeResultCopyWith<TravelTimeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelTimeResultCopyWith<$Res> {
  factory $TravelTimeResultCopyWith(
    TravelTimeResult value,
    $Res Function(TravelTimeResult) then,
  ) = _$TravelTimeResultCopyWithImpl<$Res, TravelTimeResult>;
  @useResult
  $Res call({int durationMinutes, String distanceText, int distanceMeters});
}

/// @nodoc
class _$TravelTimeResultCopyWithImpl<$Res, $Val extends TravelTimeResult>
    implements $TravelTimeResultCopyWith<$Res> {
  _$TravelTimeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelTimeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationMinutes = null,
    Object? distanceText = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      _value.copyWith(
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            distanceText: null == distanceText
                ? _value.distanceText
                : distanceText // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceMeters: null == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TravelTimeResultImplCopyWith<$Res>
    implements $TravelTimeResultCopyWith<$Res> {
  factory _$$TravelTimeResultImplCopyWith(
    _$TravelTimeResultImpl value,
    $Res Function(_$TravelTimeResultImpl) then,
  ) = __$$TravelTimeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int durationMinutes, String distanceText, int distanceMeters});
}

/// @nodoc
class __$$TravelTimeResultImplCopyWithImpl<$Res>
    extends _$TravelTimeResultCopyWithImpl<$Res, _$TravelTimeResultImpl>
    implements _$$TravelTimeResultImplCopyWith<$Res> {
  __$$TravelTimeResultImplCopyWithImpl(
    _$TravelTimeResultImpl _value,
    $Res Function(_$TravelTimeResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelTimeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationMinutes = null,
    Object? distanceText = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      _$TravelTimeResultImpl(
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        distanceText: null == distanceText
            ? _value.distanceText
            : distanceText // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceMeters: null == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TravelTimeResultImpl extends _TravelTimeResult {
  const _$TravelTimeResultImpl({
    required this.durationMinutes,
    required this.distanceText,
    required this.distanceMeters,
  }) : super._();

  @override
  final int durationMinutes;
  @override
  final String distanceText;
  @override
  final int distanceMeters;

  @override
  String toString() {
    return 'TravelTimeResult(durationMinutes: $durationMinutes, distanceText: $distanceText, distanceMeters: $distanceMeters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelTimeResultImpl &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.distanceText, distanceText) ||
                other.distanceText == distanceText) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, durationMinutes, distanceText, distanceMeters);

  /// Create a copy of TravelTimeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelTimeResultImplCopyWith<_$TravelTimeResultImpl> get copyWith =>
      __$$TravelTimeResultImplCopyWithImpl<_$TravelTimeResultImpl>(
        this,
        _$identity,
      );
}

abstract class _TravelTimeResult extends TravelTimeResult {
  const factory _TravelTimeResult({
    required final int durationMinutes,
    required final String distanceText,
    required final int distanceMeters,
  }) = _$TravelTimeResultImpl;
  const _TravelTimeResult._() : super._();

  @override
  int get durationMinutes;
  @override
  String get distanceText;
  @override
  int get distanceMeters;

  /// Create a copy of TravelTimeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelTimeResultImplCopyWith<_$TravelTimeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
