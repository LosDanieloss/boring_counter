import 'package:injectable/injectable.dart';
import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/di/injectable/all.dart';

@staging
@Injectable(as: AppConfig)
class StagingAppConfig extends AppConfig {
  StagingAppConfig()
      : super(
          appTitle: "Staging boring_counter",
          baseUrl: "TODO Staging base url",
          authenticationBaseUrl: "TODO Staging auth base url",
          clientId: "TODO Staging client Id",
          isLogNetworkCommunication: true,
        );
}
