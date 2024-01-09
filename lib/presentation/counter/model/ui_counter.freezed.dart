// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiCounter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiCounterCopyWith<UiCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiCounterCopyWith<$Res> {
  factory $UiCounterCopyWith(UiCounter value, $Res Function(UiCounter) then) =
      _$UiCounterCopyWithImpl<$Res, UiCounter>;
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class _$UiCounterCopyWithImpl<$Res, $Val extends UiCounter>
    implements $UiCounterCopyWith<$Res> {
  _$UiCounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiCounterImplCopyWith<$Res>
    implements $UiCounterCopyWith<$Res> {
  factory _$$UiCounterImplCopyWith(
          _$UiCounterImpl value, $Res Function(_$UiCounterImpl) then) =
      __$$UiCounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class __$$UiCounterImplCopyWithImpl<$Res>
    extends _$UiCounterCopyWithImpl<$Res, _$UiCounterImpl>
    implements _$$UiCounterImplCopyWith<$Res> {
  __$$UiCounterImplCopyWithImpl(
      _$UiCounterImpl _value, $Res Function(_$UiCounterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$UiCounterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UiCounterImpl implements _UiCounter {
  const _$UiCounterImpl(
      {required this.id, required this.name, required this.count});

  @override
  final String id;
  @override
  final String name;
  @override
  final int count;

  @override
  String toString() {
    return 'UiCounter(id: $id, name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiCounterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiCounterImplCopyWith<_$UiCounterImpl> get copyWith =>
      __$$UiCounterImplCopyWithImpl<_$UiCounterImpl>(this, _$identity);
}

abstract class _UiCounter implements UiCounter {
  const factory _UiCounter(
      {required final String id,
      required final String name,
      required final int count}) = _$UiCounterImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$UiCounterImplCopyWith<_$UiCounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
