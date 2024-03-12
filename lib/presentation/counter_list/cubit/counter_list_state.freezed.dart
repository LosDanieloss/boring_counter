// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterListState {
  List<UiCounter> get counters => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UiCounter> counters) loading,
    required TResult Function(
            List<UiCounter> counters, bool isCounterOnTapDisabled)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UiCounter> counters)? loading,
    TResult? Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UiCounter> counters)? loading,
    TResult Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(ReadyState value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(ReadyState value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(ReadyState value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterListStateCopyWith<CounterListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterListStateCopyWith<$Res> {
  factory $CounterListStateCopyWith(
          CounterListState value, $Res Function(CounterListState) then) =
      _$CounterListStateCopyWithImpl<$Res, CounterListState>;
  @useResult
  $Res call({List<UiCounter> counters});
}

/// @nodoc
class _$CounterListStateCopyWithImpl<$Res, $Val extends CounterListState>
    implements $CounterListStateCopyWith<$Res> {
  _$CounterListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counters = null,
  }) {
    return _then(_value.copyWith(
      counters: null == counters
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as List<UiCounter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res>
    implements $CounterListStateCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UiCounter> counters});
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$CounterListStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counters = null,
  }) {
    return _then(_$LoadingStateImpl(
      counters: null == counters
          ? _value._counters
          : counters // ignore: cast_nullable_to_non_nullable
              as List<UiCounter>,
    ));
  }
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl({required final List<UiCounter> counters})
      : _counters = counters;

  final List<UiCounter> _counters;
  @override
  List<UiCounter> get counters {
    if (_counters is EqualUnmodifiableListView) return _counters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_counters);
  }

  @override
  String toString() {
    return 'CounterListState.loading(counters: $counters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingStateImpl &&
            const DeepCollectionEquality().equals(other._counters, _counters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_counters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingStateImplCopyWith<_$LoadingStateImpl> get copyWith =>
      __$$LoadingStateImplCopyWithImpl<_$LoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UiCounter> counters) loading,
    required TResult Function(
            List<UiCounter> counters, bool isCounterOnTapDisabled)
        ready,
  }) {
    return loading(counters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UiCounter> counters)? loading,
    TResult? Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
  }) {
    return loading?.call(counters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UiCounter> counters)? loading,
    TResult Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(counters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(ReadyState value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(ReadyState value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(ReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements CounterListState {
  const factory _LoadingState({required final List<UiCounter> counters}) =
      _$LoadingStateImpl;

  @override
  List<UiCounter> get counters;
  @override
  @JsonKey(ignore: true)
  _$$LoadingStateImplCopyWith<_$LoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadyStateImplCopyWith<$Res>
    implements $CounterListStateCopyWith<$Res> {
  factory _$$ReadyStateImplCopyWith(
          _$ReadyStateImpl value, $Res Function(_$ReadyStateImpl) then) =
      __$$ReadyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UiCounter> counters, bool isCounterOnTapDisabled});
}

/// @nodoc
class __$$ReadyStateImplCopyWithImpl<$Res>
    extends _$CounterListStateCopyWithImpl<$Res, _$ReadyStateImpl>
    implements _$$ReadyStateImplCopyWith<$Res> {
  __$$ReadyStateImplCopyWithImpl(
      _$ReadyStateImpl _value, $Res Function(_$ReadyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counters = null,
    Object? isCounterOnTapDisabled = null,
  }) {
    return _then(_$ReadyStateImpl(
      counters: null == counters
          ? _value._counters
          : counters // ignore: cast_nullable_to_non_nullable
              as List<UiCounter>,
      isCounterOnTapDisabled: null == isCounterOnTapDisabled
          ? _value.isCounterOnTapDisabled
          : isCounterOnTapDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReadyStateImpl implements ReadyState {
  const _$ReadyStateImpl(
      {required final List<UiCounter> counters,
      required this.isCounterOnTapDisabled})
      : _counters = counters;

  final List<UiCounter> _counters;
  @override
  List<UiCounter> get counters {
    if (_counters is EqualUnmodifiableListView) return _counters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_counters);
  }

  @override
  final bool isCounterOnTapDisabled;

  @override
  String toString() {
    return 'CounterListState.ready(counters: $counters, isCounterOnTapDisabled: $isCounterOnTapDisabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyStateImpl &&
            const DeepCollectionEquality().equals(other._counters, _counters) &&
            (identical(other.isCounterOnTapDisabled, isCounterOnTapDisabled) ||
                other.isCounterOnTapDisabled == isCounterOnTapDisabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_counters), isCounterOnTapDisabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyStateImplCopyWith<_$ReadyStateImpl> get copyWith =>
      __$$ReadyStateImplCopyWithImpl<_$ReadyStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UiCounter> counters) loading,
    required TResult Function(
            List<UiCounter> counters, bool isCounterOnTapDisabled)
        ready,
  }) {
    return ready(counters, isCounterOnTapDisabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UiCounter> counters)? loading,
    TResult? Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
  }) {
    return ready?.call(counters, isCounterOnTapDisabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UiCounter> counters)? loading,
    TResult Function(List<UiCounter> counters, bool isCounterOnTapDisabled)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(counters, isCounterOnTapDisabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(ReadyState value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(ReadyState value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(ReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ReadyState implements CounterListState {
  const factory ReadyState(
      {required final List<UiCounter> counters,
      required final bool isCounterOnTapDisabled}) = _$ReadyStateImpl;

  @override
  List<UiCounter> get counters;
  bool get isCounterOnTapDisabled;
  @override
  @JsonKey(ignore: true)
  _$$ReadyStateImplCopyWith<_$ReadyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
