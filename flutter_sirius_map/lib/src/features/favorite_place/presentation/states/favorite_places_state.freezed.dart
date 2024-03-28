// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_places_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritePlacesState {
  List<FavoritePlaceInstance> get favoritePlaces =>
      throw _privateConstructorUsedError;
  bool get isEditMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritePlacesStateCopyWith<FavoritePlacesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePlacesStateCopyWith<$Res> {
  factory $FavoritePlacesStateCopyWith(
          FavoritePlacesState value, $Res Function(FavoritePlacesState) then) =
      _$FavoritePlacesStateCopyWithImpl<$Res, FavoritePlacesState>;
  @useResult
  $Res call({List<FavoritePlaceInstance> favoritePlaces, bool isEditMode});
}

/// @nodoc
class _$FavoritePlacesStateCopyWithImpl<$Res, $Val extends FavoritePlacesState>
    implements $FavoritePlacesStateCopyWith<$Res> {
  _$FavoritePlacesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoritePlaces = null,
    Object? isEditMode = null,
  }) {
    return _then(_value.copyWith(
      favoritePlaces: null == favoritePlaces
          ? _value.favoritePlaces
          : favoritePlaces // ignore: cast_nullable_to_non_nullable
              as List<FavoritePlaceInstance>,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritePlacesStateImplCopyWith<$Res>
    implements $FavoritePlacesStateCopyWith<$Res> {
  factory _$$FavoritePlacesStateImplCopyWith(_$FavoritePlacesStateImpl value,
          $Res Function(_$FavoritePlacesStateImpl) then) =
      __$$FavoritePlacesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FavoritePlaceInstance> favoritePlaces, bool isEditMode});
}

/// @nodoc
class __$$FavoritePlacesStateImplCopyWithImpl<$Res>
    extends _$FavoritePlacesStateCopyWithImpl<$Res, _$FavoritePlacesStateImpl>
    implements _$$FavoritePlacesStateImplCopyWith<$Res> {
  __$$FavoritePlacesStateImplCopyWithImpl(_$FavoritePlacesStateImpl _value,
      $Res Function(_$FavoritePlacesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoritePlaces = null,
    Object? isEditMode = null,
  }) {
    return _then(_$FavoritePlacesStateImpl(
      favoritePlaces: null == favoritePlaces
          ? _value._favoritePlaces
          : favoritePlaces // ignore: cast_nullable_to_non_nullable
              as List<FavoritePlaceInstance>,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoritePlacesStateImpl implements _FavoritePlacesState {
  const _$FavoritePlacesStateImpl(
      {final List<FavoritePlaceInstance> favoritePlaces = const [],
      this.isEditMode = false})
      : _favoritePlaces = favoritePlaces;

  final List<FavoritePlaceInstance> _favoritePlaces;
  @override
  @JsonKey()
  List<FavoritePlaceInstance> get favoritePlaces {
    if (_favoritePlaces is EqualUnmodifiableListView) return _favoritePlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePlaces);
  }

  @override
  @JsonKey()
  final bool isEditMode;

  @override
  String toString() {
    return 'FavoritePlacesState(favoritePlaces: $favoritePlaces, isEditMode: $isEditMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritePlacesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoritePlaces, _favoritePlaces) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favoritePlaces), isEditMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritePlacesStateImplCopyWith<_$FavoritePlacesStateImpl> get copyWith =>
      __$$FavoritePlacesStateImplCopyWithImpl<_$FavoritePlacesStateImpl>(
          this, _$identity);
}

abstract class _FavoritePlacesState implements FavoritePlacesState {
  const factory _FavoritePlacesState(
      {final List<FavoritePlaceInstance> favoritePlaces,
      final bool isEditMode}) = _$FavoritePlacesStateImpl;

  @override
  List<FavoritePlaceInstance> get favoritePlaces;
  @override
  bool get isEditMode;
  @override
  @JsonKey(ignore: true)
  _$$FavoritePlacesStateImplCopyWith<_$FavoritePlacesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
