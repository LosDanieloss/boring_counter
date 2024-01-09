import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FirebaseCrashlytics>()])
import 'firebase_tracker_test.mocks.dart';

void main() {
  late MockFirebaseCrashlytics crashlytics;
  late ErrorTracker tracker;

  group(
    'Test screen tracking using Firebase tracker',
    () {
      setUp(
        () {
          crashlytics = MockFirebaseCrashlytics();
          tracker = FirebaseErrorTracker(
            crashlytics: crashlytics,
          );
        },
      );

      test(
        'Given fatal exception test and some stacktrace '
        'when tracking fatal '
        'then both should be reported into crashlytics as fatal',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('fatal');
          await tracker.trackFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(crashlytics.recordError(exception, stacktrace, fatal: true));
        },
      );

      test(
        'Given fatal exception test and no stacktrace '
        'when tracking fatal '
        'then exception and no stacktrace '
        'should be reported into crashlytics as fatal',
        () async {
          final exception = Exception('test');
          await tracker.trackFatal(
            exception: exception,
          );
          verify(crashlytics.recordError(exception, null, fatal: true));
        },
      );
    },
  );

  group(
    'Test event tracking using Firebase tracker',
    () {
      setUp(
        () {
          crashlytics = MockFirebaseCrashlytics();
          tracker = FirebaseErrorTracker(
            crashlytics: crashlytics,
          );
        },
      );

      test(
        'Given non fatal exception test and some stacktrace '
        'when tracking non fatal '
        'then both should be reported into crashlytics as non fatal',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('non fatal');
          await tracker.trackNonFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(crashlytics.recordError(exception, stacktrace));
        },
      );

      test(
        'Given non fatal exception test and no stacktrace '
        'when tracking non fatal '
        'then exception and no stacktrace '
        'should be reported into crashlytics as non fatal',
        () async {
          final exception = Exception('test');
          await tracker.trackNonFatal(
            exception: exception,
          );
          verify(crashlytics.recordError(exception, null));
        },
      );
    },
  );
}
