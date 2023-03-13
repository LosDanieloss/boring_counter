import 'package:flutter/widgets.dart';
import 'package:boring_counter/app/app.dart';
import 'package:boring_counter/bootstrap.dart';
import 'package:boring_counter/config/dart/dart_config.dart';
import 'package:boring_counter/config/firebase/firebase_config.dart';
import 'package:boring_counter/di/injectable/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureFirebaseApp(
    environment: EnvironmentName.staging,
  );
  await configureDependencies(
    environment: EnvironmentName.staging,
  );
  await configureDartEnvironment();
  await bootstrap(
    () => App(),
  );
}
