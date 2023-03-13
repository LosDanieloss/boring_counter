import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:boring_counter/data_source/local_storage/local_storage.dart';
import 'package:boring_counter/data_source/rest/authentication_rest_client.dart';
import 'package:boring_counter/data_source/rest/dto/login_request_dto.dart';
import 'package:boring_counter/data_source/rest/dto/refresh_session_dto.dart';
import 'package:boring_counter/data_source/session/session_mapper.dart';
import 'package:boring_counter/domain/session/session.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@Singleton(as: SessionRepository)
class DefaultSessionRepository implements SessionRepository {
  DefaultSessionRepository({
    required this.authenticationRestClient,
    required this.sessionMapper,
    required this.localStorage,
  });

  final AuthenticationRestClient authenticationRestClient;
  final SessionMapper sessionMapper;
  final LocalStorage localStorage;

  final StreamController<Session?> _sessionStreamController =
      StreamController.broadcast();

  @override
  Future<Session> createSession({
    required String login,
    required String password,
  }) async {
    final loginRequestDto = LoginRequestDto(
      login: login,
      password: password,
    );
    final sessionDto = await authenticationRestClient.login(
      loginRequestDto: loginRequestDto,
    );
    final session = sessionMapper.mapToSession(
      sessionDto: sessionDto,
    );
    await localStorage.storeSession(
      session: session,
    );
    updateSessionStream(
      session: session,
    );
    return session;
  }

  @override
  Future<Session> refreshSession() async {
    final maybeRefreshToken = (await retrieveCurrentSession())?.refreshToken;
    if (maybeRefreshToken == null) {
      throw Exception(
        "Couldn't refresh session because session refresh token is missing.",
      );
    }
    final refreshSessionDto = RefreshSessionDto(
      refreshToken: maybeRefreshToken,
    );
    final newSessionDto = await authenticationRestClient.refreshSession(
      refreshSessionDto: refreshSessionDto,
    );
    final newSession = sessionMapper.mapToSession(
      sessionDto: newSessionDto,
    );
    await localStorage.storeSession(
      session: newSession,
    );
    updateSessionStream(
      session: newSession,
    );
    return newSession;
  }

  void updateSessionStream({
    required Session? session,
  }) {
    _sessionStreamController.add(
      session,
    );
  }

  @override
  Future<void> removeSession() async {
    final maybeSession = await retrieveCurrentSession();
    final maybeToken = maybeSession?.accessToken;
    await authenticationRestClient.logout(maybeToken);
    updateSessionStream(
      session: null,
    );
  }

  @override
  Future<Session?> retrieveCurrentSession() async {
    final session = await localStorage.retrieveSession();
    updateSessionStream(
      session: session,
    );
    return session;
  }

  @override
  Stream<Session?> watchSession() => _sessionStreamController.stream;
}
