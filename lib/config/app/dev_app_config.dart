import 'package:injectable/injectable.dart';
import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/di/injectable/all.dart';

@development
@Injectable(as: AppConfig)
class DevelopmentAppConfig extends AppConfig {
  DevelopmentAppConfig()
      : super(
          appTitle: "Dev boring_counter",
          baseUrl: "TODO Dev base url",
          authenticationBaseUrl: "TODO Dev auth base url",
          clientId: "TODO Dev client Id",
          isLogNetworkCommunication: true,
        );
}
