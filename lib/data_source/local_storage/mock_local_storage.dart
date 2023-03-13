import 'package:injectable/injectable.dart';
import 'package:boring_counter/data_source/local_storage/local_storage.dart';
import 'package:boring_counter/domain/session/session.dart';

@Injectable(as: LocalStorage)
class MockLocalStorage implements LocalStorage {
  static const _session = Session(
    accessToken: 'accessToken',
    refreshToken: 'refreshToken',
  );

  @override
  Future<Session?> retrieveSession() async => _session;

  @override
  Future<void> storeSession({required Session? session}) async {
    // MARK: expected to do nothing
  }
}
