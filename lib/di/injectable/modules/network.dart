import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/data_source/local_storage/local_storage.dart';
import 'package:boring_counter/data_source/rest/authentication_rest_client.dart';
import 'package:boring_counter/data_source/rest/data_rest_client.dart';
import 'package:boring_counter/data_source/rest/re_authenticate_interceptor.dart';
import 'package:boring_counter/data_source/rest/session_interceptor.dart';
import 'package:boring_counter/domain/session/session_repository.dart';

@module
abstract class NetworkModule {
  @Named(AuthenticationRestClient.httpClientName)
  Dio getAuthDio(AppConfig appConfig) {
    final dio = Dio();

    if (appConfig.isLogNetworkCommunication) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          compact: false,
        ),
      );
    }

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: appConfig.autoRetryRequestOnFailureCount,
      ),
    );

    return dio;
  }

  @lazySingleton
  AuthenticationRestClient getAuthClient(
    @Named(AuthenticationRestClient.httpClientName) Dio dio,
    AppConfig appConfig,
  ) =>
      AuthenticationRestClient(
        dio,
        baseUrl: appConfig.authenticationBaseUrl,
      );

  ReAuthenticateInterceptor getReAuthenticationInterceptor(
    SessionRepository sessionRepository,
  ) =>
      ReAuthenticateInterceptor(
        sessionRepository: sessionRepository,
      );

  SessionInterceptor getSessionInterceptor(
    LocalStorage localStorage,
  ) =>
      SessionInterceptor(
        localStorage: localStorage,
      );

  @Named(DataRestClient.httpClientName)
  Dio getDataDio(
    ReAuthenticateInterceptor reAuthenticateInterceptor,
    SessionInterceptor sessionInterceptor,
    AppConfig appConfig,
  ) {
    final dio = Dio();

    if (appConfig.isLogNetworkCommunication) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          compact: false,
        ),
      );
    }

    if (appConfig.isAutoRenewUserSession) {
      dio.interceptors.add(reAuthenticateInterceptor);
      dio.interceptors.add(sessionInterceptor);
    }

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: appConfig.autoRetryRequestOnFailureCount,
      ),
    );

    return dio;
  }

  @lazySingleton
  DataRestClient getDataClient(
    @Named(DataRestClient.httpClientName) Dio dio,
    AppConfig appConfig,
  ) =>
      DataRestClient(
        dio,
        baseUrl: appConfig.baseUrl,
      );
}
