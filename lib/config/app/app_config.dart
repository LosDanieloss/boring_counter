/// Contains basic Application information that differ between App flavors
abstract class AppConfig {
  AppConfig({
    required this.appTitle,
    required this.baseUrl,
    required this.authenticationBaseUrl,
    required this.clientId,
    this.grantType = 'Bearer',
    this.connectTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 10),
    this.autoRetryRequestOnFailureCount = 3,
    this.isAutoRenewUserSession = true,
    this.isLogNetworkCommunication = false,
  });

  final String appTitle;
  final String baseUrl;
  final String authenticationBaseUrl;
  final String clientId;
  final String grantType;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final int autoRetryRequestOnFailureCount;
  final bool isAutoRenewUserSession;
  final bool isLogNetworkCommunication;
}
