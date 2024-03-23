// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cachePath, List<LatLng> route) pathLoaded,
    required TResult Function(String? message) error,
    required TResult Function(String? message) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult Function(String? message)? error,
    TResult Function(String? message)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(pathLoaded value) pathLoaded,
    required TResult Function(MapStateError value) error,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(pathLoaded value)? pathLoaded,
    TResult? Function(MapStateError value)? error,
    TResult? Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(pathLoaded value)? pathLoaded,
    TResult Function(MapStateError value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$pathLoadedImplCopyWith<$Res> {
  factory _$$pathLoadedImplCopyWith(
          _$pathLoadedImpl value, $Res Function(_$pathLoadedImpl) then) =
      __$$pathLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cachePath, List<LatLng> route});
}

/// @nodoc
class __$$pathLoadedImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$pathLoadedImpl>
    implements _$$pathLoadedImplCopyWith<$Res> {
  __$$pathLoadedImplCopyWithImpl(
      _$pathLoadedImpl _value, $Res Function(_$pathLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cachePath = null,
    Object? route = null,
  }) {
    return _then(_$pathLoadedImpl(
      cachePath: null == cachePath
          ? _value.cachePath
          : cachePath // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc

class _$pathLoadedImpl implements pathLoaded {
  const _$pathLoadedImpl(
      {required this.cachePath, required final List<LatLng> route})
      : _route = route;

  @override
  final String cachePath;
  final List<LatLng> _route;
  @override
  List<LatLng> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  String toString() {
    return 'MapState.pathLoaded(cachePath: $cachePath, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$pathLoadedImpl &&
            (identical(other.cachePath, cachePath) ||
                other.cachePath == cachePath) &&
            const DeepCollectionEquality().equals(other._route, _route));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, cachePath, const DeepCollectionEquality().hash(_route));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$pathLoadedImplCopyWith<_$pathLoadedImpl> get copyWith =>
      __$$pathLoadedImplCopyWithImpl<_$pathLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cachePath, List<LatLng> route) pathLoaded,
    required TResult Function(String? message) error,
    required TResult Function(String? message) loading,
  }) {
    return pathLoaded(cachePath, route);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? loading,
  }) {
    return pathLoaded?.call(cachePath, route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult Function(String? message)? error,
    TResult Function(String? message)? loading,
    required TResult orElse(),
  }) {
    if (pathLoaded != null) {
      return pathLoaded(cachePath, route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(pathLoaded value) pathLoaded,
    required TResult Function(MapStateError value) error,
    required TResult Function(Loading value) loading,
  }) {
    return pathLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(pathLoaded value)? pathLoaded,
    TResult? Function(MapStateError value)? error,
    TResult? Function(Loading value)? loading,
  }) {
    return pathLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(pathLoaded value)? pathLoaded,
    TResult Function(MapStateError value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (pathLoaded != null) {
      return pathLoaded(this);
    }
    return orElse();
  }
}

abstract class pathLoaded implements MapState {
  const factory pathLoaded(
      {required final String cachePath,
      required final List<LatLng> route}) = _$pathLoadedImpl;

  String get cachePath;
  List<LatLng> get route;
  @JsonKey(ignore: true)
  _$$pathLoadedImplCopyWith<_$pathLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapStateErrorImplCopyWith<$Res> {
  factory _$$MapStateErrorImplCopyWith(
          _$MapStateErrorImpl value, $Res Function(_$MapStateErrorImpl) then) =
      __$$MapStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$MapStateErrorImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateErrorImpl>
    implements _$$MapStateErrorImplCopyWith<$Res> {
  __$$MapStateErrorImplCopyWithImpl(
      _$MapStateErrorImpl _value, $Res Function(_$MapStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$MapStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MapStateErrorImpl implements MapStateError {
  const _$MapStateErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'MapState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateErrorImplCopyWith<_$MapStateErrorImpl> get copyWith =>
      __$$MapStateErrorImplCopyWithImpl<_$MapStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cachePath, List<LatLng> route) pathLoaded,
    required TResult Function(String? message) error,
    required TResult Function(String? message) loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult Function(String? message)? error,
    TResult Function(String? message)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(pathLoaded value) pathLoaded,
    required TResult Function(MapStateError value) error,
    required TResult Function(Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(pathLoaded value)? pathLoaded,
    TResult? Function(MapStateError value)? error,
    TResult? Function(Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(pathLoaded value)? pathLoaded,
    TResult Function(MapStateError value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MapStateError implements MapState {
  const factory MapStateError([final String? message]) = _$MapStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$MapStateErrorImplCopyWith<_$MapStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$LoadingImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'MapState.loading(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cachePath, List<LatLng> route) pathLoaded,
    required TResult Function(String? message) error,
    required TResult Function(String? message) loading,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? loading,
  }) {
    return loading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cachePath, List<LatLng> route)? pathLoaded,
    TResult Function(String? message)? error,
    TResult Function(String? message)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(pathLoaded value) pathLoaded,
    required TResult Function(MapStateError value) error,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(pathLoaded value)? pathLoaded,
    TResult? Function(MapStateError value)? error,
    TResult? Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(pathLoaded value)? pathLoaded,
    TResult Function(MapStateError value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MapState {
  const factory Loading([final String? message]) = _$LoadingImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
