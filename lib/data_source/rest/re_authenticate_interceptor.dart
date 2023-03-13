import 'package:dio/dio.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

class ReAuthenticateInterceptor extends Interceptor {
  ReAuthenticateInterceptor({
    required this.sessionRepository,
  });

  static const List<int> _authenticationErrorCodes = [
    401,
    403,
  ];

  final SessionRepository sessionRepository;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type != DioErrorType.response) {
      return super.onError(err, handler);
    }

    final maybeErrorCode = err.response?.statusCode;
    if (maybeErrorCode == null) {
      return super.onError(err, handler);
    }

    final isNotProblemWithAuthentication =
        !_authenticationErrorCodes.contains(maybeErrorCode);
    if (isNotProblemWithAuthentication) {
      return super.onError(err, handler);
    }

    try {
      await sessionRepository.refreshSession();

      /*** MARK:  returns error because request will be automatically retried
       * when AppConfig.autoRetryRequestOnFailureCount is set to positive int
       ***/
      return super.onError(err, handler);
    } catch (e) {
      return super.onError(err, handler);
    }
  }
}
