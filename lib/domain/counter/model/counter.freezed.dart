// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Counter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res, Counter>;
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res, $Val extends Counter>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

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
abstract class _$$_CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$_CounterCopyWith(
          _$_Counter value, $Res Function(_$_Counter) then) =
      __$$_CounterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class __$$_CounterCopyWithImpl<$Res>
    extends _$CounterCopyWithImpl<$Res, _$_Counter>
    implements _$$_CounterCopyWith<$Res> {
  __$$_CounterCopyWithImpl(_$_Counter _value, $Res Function(_$_Counter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$_Counter(
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

class _$_Counter implements _Counter {
  const _$_Counter({required this.id, required this.name, required this.count});

  @override
  final String id;
  @override
  final String name;
  @override
  final int count;

  @override
  String toString() {
    return 'Counter(id: $id, name: $name, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Counter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      __$$_CounterCopyWithImpl<_$_Counter>(this, _$identity);
}

abstract class _Counter implements Counter {
  const factory _Counter(
      {required final String id,
      required final String name,
      required final int count}) = _$_Counter;

  @override
  String get id;
  @override
  String get name;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      throw _privateConstructorUsedError;
}
