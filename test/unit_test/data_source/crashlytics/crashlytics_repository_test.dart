import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart';
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ErrorTracker>()])
import 'crashlytics_repository_test.mocks.dart';

void main() {
  late MockErrorTracker tracker;
  late CrashlyticsRepository repository;

  group(
    'Test fatal error tracking via crashlytics repository',
    () {
      setUp(
        () {
          tracker = MockErrorTracker();
          repository = DefaultCrashlyticsRepository(
            trackers: [
              tracker,
              tracker,
            ],
          );
        },
      );

      test(
        'Given fatal exception test and some stacktrace '
        'when tracking fatal '
        'then both should be passed into trackers',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('fatal');
          await repository.trackFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(
            tracker.trackFatal(
              exception: exception,
              stackTrace: stacktrace,
            ),
          ).called(2);
        },
      );

      test(
        'Given fatal exception test and no stacktrace '
        'when tracking fatal '
        'then exception without stacktrace should be passed into trackers',
        () async {
          final exception = Exception('test');
          await repository.trackFatal(exception: exception);
          verify(
            tracker.trackFatal(
              exception: exception,
            ),
          ).called(2);
        },
      );
    },
  );

  group(
    'Test non fatal error tracking via crashlytics repository',
    () {
      setUp(
        () {
          tracker = MockErrorTracker();
          repository = DefaultCrashlyticsRepository(
            trackers: [
              tracker,
              tracker,
            ],
          );
        },
      );

      test(
        'Given non fatal exception test and some stacktrace '
        'when tracking non fatal '
        'then both should be passed into trackers',
        () async {
          final exception = Exception('test');
          final stackTrace = StackTrace.fromString('non fatal');
          await repository.trackNonFatal(
            exception: exception,
            stackTrace: stackTrace,
          );
          verify(
            tracker.trackNonFatal(
              exception: exception,
              stackTrace: stackTrace,
            ),
          ).called(2);
        },
      );

      test(
        'Given non fatal exception test and no stacktrace '
        'when tracking non fatal '
        'then exception and stacktrace '
        'should be passed into trackers',
        () async {
          final exception = Exception('test');
          await repository.trackNonFatal(exception: exception);
          verify(
            tracker.trackNonFatal(
              exception: exception,
            ),
          ).called(2);
        },
      );
    },
  );
}
