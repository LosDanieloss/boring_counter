import 'package:dio/dio.dart';
import 'package:boring_counter/data_source/local_storage/local_storage.dart';

class SessionInterceptor extends Interceptor {
  SessionInterceptor({
    required this.localStorage,
  });

  final LocalStorage localStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final maybeSession = await localStorage.retrieveSession();
    if (maybeSession != null) {
      options.headers.putIfAbsent(
        'Authentication',
        () => maybeSession.accessToken,
      );
    }
    super.onRequest(options, handler);
  }
}
