import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/config/app/dev_app_config.dart';
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart';
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart';

@module
abstract class CrashlyticsModule {
  FirebaseCrashlytics getFirebaseCrashlytics() => FirebaseCrashlytics.instance;

  List<ErrorTracker> getErrorTrackers(
    AppConfig appConfig,
    FirebaseErrorTracker firebaseErrorTracker,
    StdOutErrorTracker stdOutErrorTracker,
  ) {
    final trackers = <ErrorTracker>[
      firebaseErrorTracker,
    ];

    if (appConfig is DevelopmentAppConfig) {
      trackers.add(stdOutErrorTracker);
    }
    return trackers;
  }
}
