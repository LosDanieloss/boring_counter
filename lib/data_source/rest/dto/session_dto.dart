import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_dto.freezed.dart';
part 'session_dto.g.dart';

@freezed
class SessionDto with _$SessionDto {
  const factory SessionDto({
    required String accessToken,
    required String refreshToken,
  }) = _SessionDto;

  factory SessionDto.fromJson(Map<String, Object?> json) =>
      _$SessionDtoFromJson(json);
}
