import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_session_dto.freezed.dart';
part 'refresh_session_dto.g.dart';

@freezed
class RefreshSessionDto with _$RefreshSessionDto {
  const factory RefreshSessionDto({
    required String refreshToken,
  }) = _RefreshSessionDto;

  factory RefreshSessionDto.fromJson(Map<String, Object?> json) =>
      _$RefreshSessionDtoFromJson(json);
}
