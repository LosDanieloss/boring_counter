// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) {
  return _LoginRequestDto.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestDto {
  String get login => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestDtoCopyWith<LoginRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestDtoCopyWith<$Res> {
  factory $LoginRequestDtoCopyWith(
          LoginRequestDto value, $Res Function(LoginRequestDto) then) =
      _$LoginRequestDtoCopyWithImpl<$Res, LoginRequestDto>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class _$LoginRequestDtoCopyWithImpl<$Res, $Val extends LoginRequestDto>
    implements $LoginRequestDtoCopyWith<$Res> {
  _$LoginRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginRequestDtoCopyWith<$Res>
    implements $LoginRequestDtoCopyWith<$Res> {
  factory _$$_LoginRequestDtoCopyWith(
          _$_LoginRequestDto value, $Res Function(_$_LoginRequestDto) then) =
      __$$_LoginRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$_LoginRequestDtoCopyWithImpl<$Res>
    extends _$LoginRequestDtoCopyWithImpl<$Res, _$_LoginRequestDto>
    implements _$$_LoginRequestDtoCopyWith<$Res> {
  __$$_LoginRequestDtoCopyWithImpl(
      _$_LoginRequestDto _value, $Res Function(_$_LoginRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$_LoginRequestDto(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginRequestDto implements _LoginRequestDto {
  const _$_LoginRequestDto({required this.login, required this.password});

  factory _$_LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoginRequestDtoFromJson(json);

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequestDto(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginRequestDto &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginRequestDtoCopyWith<_$_LoginRequestDto> get copyWith =>
      __$$_LoginRequestDtoCopyWithImpl<_$_LoginRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginRequestDtoToJson(
      this,
    );
  }
}

abstract class _LoginRequestDto implements LoginRequestDto {
  const factory _LoginRequestDto(
      {required final String login,
      required final String password}) = _$_LoginRequestDto;

  factory _LoginRequestDto.fromJson(Map<String, dynamic> json) =
      _$_LoginRequestDto.fromJson;

  @override
  String get login;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginRequestDtoCopyWith<_$_LoginRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}
