// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritePlaceInstance {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritePlaceInstanceCopyWith<FavoritePlaceInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePlaceInstanceCopyWith<$Res> {
  factory $FavoritePlaceInstanceCopyWith(FavoritePlaceInstance value,
          $Res Function(FavoritePlaceInstance) then) =
      _$FavoritePlaceInstanceCopyWithImpl<$Res, FavoritePlaceInstance>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$FavoritePlaceInstanceCopyWithImpl<$Res,
        $Val extends FavoritePlaceInstance>
    implements $FavoritePlaceInstanceCopyWith<$Res> {
  _$FavoritePlaceInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritePlaceInstanceImplCopyWith<$Res>
    implements $FavoritePlaceInstanceCopyWith<$Res> {
  factory _$$FavoritePlaceInstanceImplCopyWith(
          _$FavoritePlaceInstanceImpl value,
          $Res Function(_$FavoritePlaceInstanceImpl) then) =
      __$$FavoritePlaceInstanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$FavoritePlaceInstanceImplCopyWithImpl<$Res>
    extends _$FavoritePlaceInstanceCopyWithImpl<$Res,
        _$FavoritePlaceInstanceImpl>
    implements _$$FavoritePlaceInstanceImplCopyWith<$Res> {
  __$$FavoritePlaceInstanceImplCopyWithImpl(_$FavoritePlaceInstanceImpl _value,
      $Res Function(_$FavoritePlaceInstanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$FavoritePlaceInstanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoritePlaceInstanceImpl implements _FavoritePlaceInstance {
  const _$FavoritePlaceInstanceImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'FavoritePlaceInstance(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritePlaceInstanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritePlaceInstanceImplCopyWith<_$FavoritePlaceInstanceImpl>
      get copyWith => __$$FavoritePlaceInstanceImplCopyWithImpl<
          _$FavoritePlaceInstanceImpl>(this, _$identity);
}

abstract class _FavoritePlaceInstance implements FavoritePlaceInstance {
  const factory _FavoritePlaceInstance(
      {required final int id,
      required final String name}) = _$FavoritePlaceInstanceImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FavoritePlaceInstanceImplCopyWith<_$FavoritePlaceInstanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
