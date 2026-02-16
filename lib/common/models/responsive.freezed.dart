// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responsive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Responsive {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isMobile,
    required TResult Function() isTablet,
    required TResult Function() isDesktop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isMobile,
    TResult? Function()? isTablet,
    TResult? Function()? isDesktop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isMobile,
    TResult Function()? isTablet,
    TResult Function()? isDesktop,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsMobile value) isMobile,
    required TResult Function(IsTablet value) isTablet,
    required TResult Function(IsDesktop value) isDesktop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsMobile value)? isMobile,
    TResult? Function(IsTablet value)? isTablet,
    TResult? Function(IsDesktop value)? isDesktop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsMobile value)? isMobile,
    TResult Function(IsTablet value)? isTablet,
    TResult Function(IsDesktop value)? isDesktop,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsiveCopyWith<$Res> {
  factory $ResponsiveCopyWith(
    Responsive value,
    $Res Function(Responsive) then,
  ) = _$ResponsiveCopyWithImpl<$Res, Responsive>;
}

/// @nodoc
class _$ResponsiveCopyWithImpl<$Res, $Val extends Responsive>
    implements $ResponsiveCopyWith<$Res> {
  _$ResponsiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Responsive
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IsMobileImplCopyWith<$Res> {
  factory _$$IsMobileImplCopyWith(
    _$IsMobileImpl value,
    $Res Function(_$IsMobileImpl) then,
  ) = __$$IsMobileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsMobileImplCopyWithImpl<$Res>
    extends _$ResponsiveCopyWithImpl<$Res, _$IsMobileImpl>
    implements _$$IsMobileImplCopyWith<$Res> {
  __$$IsMobileImplCopyWithImpl(
    _$IsMobileImpl _value,
    $Res Function(_$IsMobileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Responsive
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsMobileImpl implements IsMobile {
  const _$IsMobileImpl();

  @override
  String toString() {
    return 'Responsive.isMobile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsMobileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isMobile,
    required TResult Function() isTablet,
    required TResult Function() isDesktop,
  }) {
    return isMobile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isMobile,
    TResult? Function()? isTablet,
    TResult? Function()? isDesktop,
  }) {
    return isMobile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isMobile,
    TResult Function()? isTablet,
    TResult Function()? isDesktop,
    required TResult orElse(),
  }) {
    if (isMobile != null) {
      return isMobile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsMobile value) isMobile,
    required TResult Function(IsTablet value) isTablet,
    required TResult Function(IsDesktop value) isDesktop,
  }) {
    return isMobile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsMobile value)? isMobile,
    TResult? Function(IsTablet value)? isTablet,
    TResult? Function(IsDesktop value)? isDesktop,
  }) {
    return isMobile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsMobile value)? isMobile,
    TResult Function(IsTablet value)? isTablet,
    TResult Function(IsDesktop value)? isDesktop,
    required TResult orElse(),
  }) {
    if (isMobile != null) {
      return isMobile(this);
    }
    return orElse();
  }
}

abstract class IsMobile implements Responsive {
  const factory IsMobile() = _$IsMobileImpl;
}

/// @nodoc
abstract class _$$IsTabletImplCopyWith<$Res> {
  factory _$$IsTabletImplCopyWith(
    _$IsTabletImpl value,
    $Res Function(_$IsTabletImpl) then,
  ) = __$$IsTabletImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsTabletImplCopyWithImpl<$Res>
    extends _$ResponsiveCopyWithImpl<$Res, _$IsTabletImpl>
    implements _$$IsTabletImplCopyWith<$Res> {
  __$$IsTabletImplCopyWithImpl(
    _$IsTabletImpl _value,
    $Res Function(_$IsTabletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Responsive
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsTabletImpl implements IsTablet {
  const _$IsTabletImpl();

  @override
  String toString() {
    return 'Responsive.isTablet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsTabletImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isMobile,
    required TResult Function() isTablet,
    required TResult Function() isDesktop,
  }) {
    return isTablet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isMobile,
    TResult? Function()? isTablet,
    TResult? Function()? isDesktop,
  }) {
    return isTablet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isMobile,
    TResult Function()? isTablet,
    TResult Function()? isDesktop,
    required TResult orElse(),
  }) {
    if (isTablet != null) {
      return isTablet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsMobile value) isMobile,
    required TResult Function(IsTablet value) isTablet,
    required TResult Function(IsDesktop value) isDesktop,
  }) {
    return isTablet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsMobile value)? isMobile,
    TResult? Function(IsTablet value)? isTablet,
    TResult? Function(IsDesktop value)? isDesktop,
  }) {
    return isTablet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsMobile value)? isMobile,
    TResult Function(IsTablet value)? isTablet,
    TResult Function(IsDesktop value)? isDesktop,
    required TResult orElse(),
  }) {
    if (isTablet != null) {
      return isTablet(this);
    }
    return orElse();
  }
}

abstract class IsTablet implements Responsive {
  const factory IsTablet() = _$IsTabletImpl;
}

/// @nodoc
abstract class _$$IsDesktopImplCopyWith<$Res> {
  factory _$$IsDesktopImplCopyWith(
    _$IsDesktopImpl value,
    $Res Function(_$IsDesktopImpl) then,
  ) = __$$IsDesktopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsDesktopImplCopyWithImpl<$Res>
    extends _$ResponsiveCopyWithImpl<$Res, _$IsDesktopImpl>
    implements _$$IsDesktopImplCopyWith<$Res> {
  __$$IsDesktopImplCopyWithImpl(
    _$IsDesktopImpl _value,
    $Res Function(_$IsDesktopImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Responsive
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsDesktopImpl implements IsDesktop {
  const _$IsDesktopImpl();

  @override
  String toString() {
    return 'Responsive.isDesktop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsDesktopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isMobile,
    required TResult Function() isTablet,
    required TResult Function() isDesktop,
  }) {
    return isDesktop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isMobile,
    TResult? Function()? isTablet,
    TResult? Function()? isDesktop,
  }) {
    return isDesktop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isMobile,
    TResult Function()? isTablet,
    TResult Function()? isDesktop,
    required TResult orElse(),
  }) {
    if (isDesktop != null) {
      return isDesktop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsMobile value) isMobile,
    required TResult Function(IsTablet value) isTablet,
    required TResult Function(IsDesktop value) isDesktop,
  }) {
    return isDesktop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsMobile value)? isMobile,
    TResult? Function(IsTablet value)? isTablet,
    TResult? Function(IsDesktop value)? isDesktop,
  }) {
    return isDesktop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsMobile value)? isMobile,
    TResult Function(IsTablet value)? isTablet,
    TResult Function(IsDesktop value)? isDesktop,
    required TResult orElse(),
  }) {
    if (isDesktop != null) {
      return isDesktop(this);
    }
    return orElse();
  }
}

abstract class IsDesktop implements Responsive {
  const factory IsDesktop() = _$IsDesktopImpl;
}
