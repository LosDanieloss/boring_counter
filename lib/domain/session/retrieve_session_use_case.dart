import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/session/session.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@injectable
class RetrieveSessionUseCase {
  RetrieveSessionUseCase({
    required this.sessionRepository,
  });

  final SessionRepository sessionRepository;

  Future<Session?> retrieveCurrentSession() =>
      sessionRepository.retrieveCurrentSession();

  Future<bool> isSessionExists() async {
    final maybeSession = await retrieveCurrentSession();
    return maybeSession != null;
  }
}
