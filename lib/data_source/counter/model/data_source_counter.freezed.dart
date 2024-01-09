// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_source_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataSourceCounter _$DataSourceCounterFromJson(Map<String, dynamic> json) {
  return _DataSourceCounter.fromJson(json);
}

/// @nodoc
mixin _$DataSourceCounter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataSourceCounterCopyWith<DataSourceCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSourceCounterCopyWith<$Res> {
  factory $DataSourceCounterCopyWith(
          DataSourceCounter value, $Res Function(DataSourceCounter) then) =
      _$DataSourceCounterCopyWithImpl<$Res, DataSourceCounter>;
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class _$DataSourceCounterCopyWithImpl<$Res, $Val extends DataSourceCounter>
    implements $DataSourceCounterCopyWith<$Res> {
  _$DataSourceCounterCopyWithImpl(this._value, this._then);

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
abstract class _$$DataSourceCounterImplCopyWith<$Res>
    implements $DataSourceCounterCopyWith<$Res> {
  factory _$$DataSourceCounterImplCopyWith(_$DataSourceCounterImpl value,
          $Res Function(_$DataSourceCounterImpl) then) =
      __$$DataSourceCounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int count});
}

/// @nodoc
class __$$DataSourceCounterImplCopyWithImpl<$Res>
    extends _$DataSourceCounterCopyWithImpl<$Res, _$DataSourceCounterImpl>
    implements _$$DataSourceCounterImplCopyWith<$Res> {
  __$$DataSourceCounterImplCopyWithImpl(_$DataSourceCounterImpl _value,
      $Res Function(_$DataSourceCounterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$DataSourceCounterImpl(
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
@JsonSerializable()
class _$DataSourceCounterImpl implements _DataSourceCounter {
  const _$DataSourceCounterImpl(
      {required this.id, required this.name, required this.count});

  factory _$DataSourceCounterImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSourceCounterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int count;

  @override
  String toString() {
    return 'DataSourceCounter(id: $id, name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSourceCounterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSourceCounterImplCopyWith<_$DataSourceCounterImpl> get copyWith =>
      __$$DataSourceCounterImplCopyWithImpl<_$DataSourceCounterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSourceCounterImplToJson(
      this,
    );
  }
}

abstract class _DataSourceCounter implements DataSourceCounter {
  const factory _DataSourceCounter(
      {required final String id,
      required final String name,
      required final int count}) = _$DataSourceCounterImpl;

  factory _DataSourceCounter.fromJson(Map<String, dynamic> json) =
      _$DataSourceCounterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$DataSourceCounterImplCopyWith<_$DataSourceCounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
