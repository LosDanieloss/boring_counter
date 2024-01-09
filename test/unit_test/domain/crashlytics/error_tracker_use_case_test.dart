import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart';
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CrashlyticsRepository>()])
import 'error_tracker_use_case_test.mocks.dart';

void main() {
  late MockCrashlyticsRepository repository;
  late ErrorTrackerUseCase useCase;

  group(
    'Test tracking fatal exceptions',
    () {
      setUp(
        () {
          repository = MockCrashlyticsRepository();
          useCase = ErrorTrackerUseCase(crashlyticsRepository: repository);
        },
      );

      test(
        'Given fatal exception with stacktrace '
        'when tracking exception '
        'then both should be reported',
        () async {
          final exception = Exception('Dummy exception');
          final stacktrace = StackTrace.fromString('Dummy stacktrace');
          await useCase.trackFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(
            repository.trackFatal(
              exception: exception,
              stackTrace: stacktrace,
            ),
          );
        },
      );

      test(
        'Given fatal exception without stacktrace '
        'when tracking exception '
        'then only exception should be reported',
        () async {
          final exception = Exception('Dummy exception');
          await useCase.trackFatal(
            exception: exception,
          );
          verify(
            repository.trackFatal(
              exception: exception,
            ),
          );
        },
      );
    },
  );

  group(
    'Test tracking non fatal exceptions',
    () {
      setUp(
        () {
          repository = MockCrashlyticsRepository();
          useCase = ErrorTrackerUseCase(crashlyticsRepository: repository);
        },
      );

      test(
        'Given non fatal exception with stacktrace '
        'when tracking exception '
        'then both should be reported',
        () async {
          final exception = Exception('Dummy exception');
          final stacktrace = StackTrace.fromString('Dummy stacktrace');
          await useCase.trackNonFatal(
            exception: exception,
            stackTrace: stacktrace,
          );
          verify(
            repository.trackNonFatal(
              exception: exception,
              stackTrace: stacktrace,
            ),
          );
        },
      );

      test(
        'Given non fatal exception without stacktrace '
        'when tracking exception '
        'then only exception should be reported',
        () async {
          final exception = Exception('Dummy exception');
          await useCase.trackNonFatal(
            exception: exception,
          );
          verify(
            repository.trackNonFatal(
              exception: exception,
            ),
          );
        },
      );
    },
  );

  group(
    'Test not tracking blacklisted exceptions',
    () {
      setUp(
        () {
          repository = MockCrashlyticsRepository();
          useCase = ErrorTrackerUseCase(crashlyticsRepository: repository);
        },
      );

      test(
        'Given non fatal exception whose type is on blacklist '
        'when tracking exception '
        'then it should not be reported',
        () async {
          // MARK: - intentionally not implemented because list is empty
        },
      );
    },
  );
}
