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
mixin _$FavoritePlace {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritePlaceCopyWith<FavoritePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePlaceCopyWith<$Res> {
  factory $FavoritePlaceCopyWith(
          FavoritePlace value, $Res Function(FavoritePlace) then) =
      _$FavoritePlaceCopyWithImpl<$Res, FavoritePlace>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$FavoritePlaceCopyWithImpl<$Res, $Val extends FavoritePlace>
    implements $FavoritePlaceCopyWith<$Res> {
  _$FavoritePlaceCopyWithImpl(this._value, this._then);

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
abstract class _$$FavoritePlaceImplCopyWith<$Res>
    implements $FavoritePlaceCopyWith<$Res> {
  factory _$$FavoritePlaceImplCopyWith(
          _$FavoritePlaceImpl value, $Res Function(_$FavoritePlaceImpl) then) =
      __$$FavoritePlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$FavoritePlaceImplCopyWithImpl<$Res>
    extends _$FavoritePlaceCopyWithImpl<$Res, _$FavoritePlaceImpl>
    implements _$$FavoritePlaceImplCopyWith<$Res> {
  __$$FavoritePlaceImplCopyWithImpl(
      _$FavoritePlaceImpl _value, $Res Function(_$FavoritePlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$FavoritePlaceImpl(
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

class _$FavoritePlaceImpl implements _FavoritePlace {
  const _$FavoritePlaceImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'FavoritePlace(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritePlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritePlaceImplCopyWith<_$FavoritePlaceImpl> get copyWith =>
      __$$FavoritePlaceImplCopyWithImpl<_$FavoritePlaceImpl>(this, _$identity);
}

abstract class _FavoritePlace implements FavoritePlace {
  const factory _FavoritePlace(
      {required final int id,
      required final String name}) = _$FavoritePlaceImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FavoritePlaceImplCopyWith<_$FavoritePlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
