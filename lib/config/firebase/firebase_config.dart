import 'package:firebase_core/firebase_core.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/firebase_options.dart' as prod;
import 'package:boring_counter/firebase_options_dev.dart' as dev;
import 'package:boring_counter/firebase_options_stg.dart' as stg;

Future<void> configureFirebaseApp({
  required String environment,
}) async {
  final options = _getFirebaseOptions(environment: environment);
  await Firebase.initializeApp(
    options: options,
  );
}

FirebaseOptions _getFirebaseOptions({
  required String environment,
}) {
  late FirebaseOptions options;
  if (environment == EnvironmentName.development) {
    options = dev.DefaultFirebaseOptions.currentPlatform;
  } else if (environment == EnvironmentName.staging) {
    options = stg.DefaultFirebaseOptions.currentPlatform;
  } else {
    options = prod.DefaultFirebaseOptions.currentPlatform;
  }
  return options;
}
