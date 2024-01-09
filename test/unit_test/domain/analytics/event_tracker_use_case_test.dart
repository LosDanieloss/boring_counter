import 'package:boring_counter/domain/analytics/analytics_repository.dart';
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AnalyticsRepository>()])
import 'event_tracker_use_case_test.mocks.dart';

void main() {
  late MockAnalyticsRepository repository;
  late EventTrackerUseCase useCase;

  group(
    'Test tracking app initialized events',
    () {
      setUp(
        () {
          repository = MockAnalyticsRepository();
          useCase = EventTrackerUseCase(analyticsRepository: repository);
        },
      );

      test(
        'Given initialization event with parameters '
        'when tracking event '
        'then event name and parameters should be reported',
        () async {
          final params = {
            'dummy': 0,
            'test': 'done',
          };
          await useCase.trackEvent(
            eventName: EventTrackerNames.appInitialized,
            parameters: params,
          );
          verify(
            repository.trackEvent(
              name: 'App_successfully_initialized',
              parameters: params,
            ),
          );
        },
      );

      test(
        'Given initialization event without parameters '
        'when tracking event '
        'then event name and no parameters should be reported',
        () async {
          await useCase.trackEvent(
            eventName: EventTrackerNames.appInitialized,
          );
          verify(
            repository.trackEvent(
              name: 'App_successfully_initialized',
            ),
          );
        },
      );
    },
  );

  group(
    'Test tracking dashboard tab switched events',
    () {
      setUp(
        () {
          repository = MockAnalyticsRepository();
          useCase = EventTrackerUseCase(analyticsRepository: repository);
        },
      );

      test(
        'Given tab switched event with parameters '
        'when tracking event '
        'then event name and parameters should be reported',
        () async {
          final params = {
            'dummy': 0,
            'test': 'done',
          };
          await useCase.trackEvent(
            eventName: EventTrackerNames.dashboardTabSwitched,
            parameters: params,
          );
          verify(
            repository.trackEvent(
              name: 'Dashboard_tab_switched',
              parameters: params,
            ),
          );
        },
      );

      test(
        'Given tab switched event without parameters '
        'when tracking event '
        'then event name and no parameters should be reported',
        () async {
          await useCase.trackEvent(
            eventName: EventTrackerNames.dashboardTabSwitched,
          );
          verify(
            repository.trackEvent(
              name: 'Dashboard_tab_switched',
            ),
          );
        },
      );
    },
  );
}
