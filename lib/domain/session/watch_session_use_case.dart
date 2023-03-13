import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/session/session.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@injectable
class WatchSessionUseCase {
  WatchSessionUseCase({
    required this.sessionRepository,
  });

  final SessionRepository sessionRepository;

  Stream<Session?> watchSession() => sessionRepository.watchSession();
}
