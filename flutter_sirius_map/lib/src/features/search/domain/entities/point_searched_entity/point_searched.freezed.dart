// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_searched.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointSearched _$PointSearchedFromJson(Map<String, dynamic> json) {
  return _PointSearched.fromJson(json);
}

/// @nodoc
mixin _$PointSearched {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointSearchedCopyWith<PointSearched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointSearchedCopyWith<$Res> {
  factory $PointSearchedCopyWith(
          PointSearched value, $Res Function(PointSearched) then) =
      _$PointSearchedCopyWithImpl<$Res, PointSearched>;
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class _$PointSearchedCopyWithImpl<$Res, $Val extends PointSearched>
    implements $PointSearchedCopyWith<$Res> {
  _$PointSearchedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointSearchedImplCopyWith<$Res>
    implements $PointSearchedCopyWith<$Res> {
  factory _$$PointSearchedImplCopyWith(
          _$PointSearchedImpl value, $Res Function(_$PointSearchedImpl) then) =
      __$$PointSearchedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class __$$PointSearchedImplCopyWithImpl<$Res>
    extends _$PointSearchedCopyWithImpl<$Res, _$PointSearchedImpl>
    implements _$$PointSearchedImplCopyWith<$Res> {
  __$$PointSearchedImplCopyWithImpl(
      _$PointSearchedImpl _value, $Res Function(_$PointSearchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$PointSearchedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointSearchedImpl implements _PointSearched {
  const _$PointSearchedImpl({required this.name, required this.id});

  factory _$PointSearchedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointSearchedImplFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'PointSearched(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointSearchedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointSearchedImplCopyWith<_$PointSearchedImpl> get copyWith =>
      __$$PointSearchedImplCopyWithImpl<_$PointSearchedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointSearchedImplToJson(
      this,
    );
  }
}

abstract class _PointSearched implements PointSearched {
  const factory _PointSearched(
      {required final String name,
      required final int id}) = _$PointSearchedImpl;

  factory _PointSearched.fromJson(Map<String, dynamic> json) =
      _$PointSearchedImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$PointSearchedImplCopyWith<_$PointSearchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
