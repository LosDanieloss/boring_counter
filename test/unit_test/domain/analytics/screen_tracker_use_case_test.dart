import 'package:boring_counter/domain/analytics/analytics_repository.dart';
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AnalyticsRepository>()])
import 'screen_tracker_use_case_test.mocks.dart';

void main() {
  late MockAnalyticsRepository repository;
  late ScreenTrackerUseCase useCase;

  group(
    'Test reporting screen names with or without class',
    () {
      setUp(
        () {
          repository = MockAnalyticsRepository();
          useCase = ScreenTrackerUseCase(analyticsRepository: repository);
        },
      );

      test(
        'Given screen name and class '
        'when tracking screen '
        'then both should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.splash,
            screenClass: 'dummyClass',
          );
          verify(
            repository.trackScreen(
              screenName: 'Splash_screen',
              screenClass: 'dummyClass',
            ),
          );
        },
      );

      test(
        'Given screen name but no class '
        'when tracking screen '
        'then only screen should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.splash,
          );
          verify(
            repository.trackScreen(
              screenName: 'Splash_screen',
            ),
          );
        },
      );
    },
  );

  group(
    'Test reporting screen names',
    () {
      setUp(
        () {
          repository = MockAnalyticsRepository();
          useCase = ScreenTrackerUseCase(analyticsRepository: repository);
        },
      );

      test(
        'Given splash screen name '
        'when tracking screen '
        'then matching raw name should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.splash,
          );
          verify(
            repository.trackScreen(
              screenName: 'Splash_screen',
            ),
          );
        },
      );

      test(
        'Given dashboard screen name '
        'when tracking screen '
        'then matching raw name should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.dashboard,
          );
          verify(
            repository.trackScreen(
              screenName: 'Dashboard',
            ),
          );
        },
      );

      test(
        'Given home screen name '
        'when tracking screen '
        'then matching raw name should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.home,
          );
          verify(
            repository.trackScreen(
              screenName: 'Home',
            ),
          );
        },
      );

      test(
        'Given counter screen name '
        'when tracking screen '
        'then matching raw name should be reported',
        () async {
          await useCase.trackScreen(
            screenName: ScreenTrackerNames.counter,
          );
          verify(
            repository.trackScreen(
              screenName: 'Counter',
            ),
          );
        },
      );
    },
  );
}
