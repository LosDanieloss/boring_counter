import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseErrorTracker implements ErrorTracker {
  FirebaseErrorTracker({
    required this.crashlytics,
  });

  final FirebaseCrashlytics crashlytics;

  @override
  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    if (kIsWeb) {
      return;
    }
    await crashlytics.recordError(
      exception,
      stackTrace,
      fatal: true,
    );
  }

  @override
  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    if (kIsWeb) {
      return;
    }
    await crashlytics.recordError(
      exception,
      stackTrace,
    );
  }
}
