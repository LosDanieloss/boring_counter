import 'package:boring_counter/domain/session/session.dart';

abstract class SessionRepository {
  Future<Session> createSession({
    required String login,
    required String password,
  });

  Future<Session?> retrieveCurrentSession();

  Future<Session> refreshSession();

  Future<void> removeSession();

  Stream<Session?> watchSession();
}
