import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:injectable/injectable.dart';

@production
@Injectable(as: AppConfig)
class ProductionAppConfig extends AppConfig {
  ProductionAppConfig()
      : super(
          appTitle: 'Prod boring_counter',
          baseUrl: 'TODO Prod base url',
          authenticationBaseUrl: 'TODO Prod auth base url',
          clientId: 'TODO Prod client Id',
        );
}
