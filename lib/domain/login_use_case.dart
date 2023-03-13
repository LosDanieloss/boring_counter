import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@injectable
class LoginUseCase {
  LoginUseCase({
    required this.sessionRepository,
  });

  SessionRepository sessionRepository;

  Future<void> login({
    required String login,
    required String password,
  }) async {
    await sessionRepository.createSession(
      login: login,
      password: password,
    );
    // TODO(all): do other things. E.g., fetch and store user data
  }
}
