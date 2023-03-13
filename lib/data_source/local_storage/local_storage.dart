import 'package:boring_counter/domain/session/session.dart';

abstract class LocalStorage {
  Future<void> storeSession({
    required Session? session,
  });

  Future<Session?> retrieveSession();
}
