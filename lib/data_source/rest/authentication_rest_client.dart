import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:boring_counter/data_source/rest/dto/login_request_dto.dart';
import 'package:boring_counter/data_source/rest/dto/refresh_session_dto.dart';
import 'package:boring_counter/data_source/rest/dto/session_dto.dart';

part 'authentication_rest_client.g.dart';

@RestApi()
abstract class AuthenticationRestClient {
  factory AuthenticationRestClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthenticationRestClient;

  static const httpClientName = 'AuthenticationHttpClient';

  @GET('/login')
  Future<SessionDto> login({
    required LoginRequestDto loginRequestDto,
  });

  @GET('/refresh_token')
  Future<SessionDto> refreshSession({
    required RefreshSessionDto refreshSessionDto,
  });

  @DELETE('/logout')
  Future<void> logout(@Header('Authorization') String? token);
}
