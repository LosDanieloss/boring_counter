import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@injectable
class LogoutUseCase {
  LogoutUseCase({
    required this.sessionRepository,
  });

  final SessionRepository sessionRepository;

  Future<void> logout() async {
    // TODO(all): remove other user related things
    await sessionRepository.removeSession();
  }
}
