import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Logger>()])
import 'std_out_tracker_test.mocks.dart';

void main() {
  late Logger logger;
  late ErrorTracker tracker;

  group(
    'Test fatal exception tracking using Std out tracker',
    () {
      setUp(
        () {
          logger = MockLogger();
          tracker = StdOutErrorTracker(
            logger: logger,
          );
        },
      );

      test(
        'Given fatal exception test and some stacktrace '
        'when tracking fatal '
        'then both should be written as error log into logger',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('fatal');
          await tracker.trackFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(logger.e(exception));
          verify(logger.e(stacktrace));
        },
      );

      test(
        'Given fatal exception test and no stacktrace '
        'when tracking fatal '
        'then exception and no stacktrace be written as error log into logger',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('fatal');
          await tracker.trackFatal(
            exception: exception,
          );
          verify(logger.e(exception));
          verifyNever(logger.e(stacktrace));
        },
      );
    },
  );

  group(
    'Test non fatal tracking using Std out tracker',
    () {
      setUp(
        () {
          logger = MockLogger();
          tracker = StdOutErrorTracker(
            logger: logger,
          );
        },
      );

      test(
        'Given non fatal exception test and some stacktrace '
        'when tracking non fatal '
        'then both should be written as error log into logger',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('non fatal');
          await tracker.trackNonFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(logger.e(exception));
          verify(logger.e(stacktrace));
        },
      );

      test(
        'Given non fatal exception test and no stacktrace '
        'when tracking non fatal '
        'then exception and no stacktrace '
        'should be written as error log into logger',
        () async {
          final exception = Exception('test');
          final stacktrace = StackTrace.fromString('non fatal');
          await tracker.trackNonFatal(
            exception: exception,
          );
          verify(logger.e(exception));
          verifyNever(logger.e(stacktrace));
        },
      );
    },
  );
}
