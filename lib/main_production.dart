import 'package:boring_counter/bootstrap.dart';
import 'package:boring_counter/config/dart/dart_config.dart';
import 'package:boring_counter/config/firebase/firebase_config.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/presentation/app/app.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureFirebaseApp(
    environment: EnvironmentName.production,
  );
  await configureDependencies(
    environment: EnvironmentName.production,
  );
  await configureDartEnvironment();
  await bootstrap(App.new);
}
