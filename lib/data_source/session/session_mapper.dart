import 'package:injectable/injectable.dart';
import 'package:boring_counter/data_source/rest/dto/session_dto.dart';
import 'package:boring_counter/domain/session/session.dart';

@injectable
class SessionMapper {
  Session mapToSession({
    required SessionDto sessionDto,
  }) {
    return Session(
      accessToken: sessionDto.accessToken,
      refreshToken: sessionDto.refreshToken,
    );
  }
}
