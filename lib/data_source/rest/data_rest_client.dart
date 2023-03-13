import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'data_rest_client.g.dart';

@RestApi()
abstract class DataRestClient {
  factory DataRestClient(
    Dio dio, {
    String baseUrl,
  }) = _DataRestClient;

  static const httpClientName = 'DataHttpClient';
}
