import 'package:boring_counter/data_source/analytics/analytics_tracker.dart';
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart';
import 'package:boring_counter/domain/analytics/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AnalyticsTracker>()])
import 'analytics_repository_test.mocks.dart';

void main() {
  late MockAnalyticsTracker tracker;
  late AnalyticsRepository repository;

  group(
    'Test screen tracking via analytics repository',
    () {
      setUp(
        () {
          tracker = MockAnalyticsTracker();
          repository = DefaultAnalyticsRepository(
            trackers: [
              tracker,
              tracker,
            ],
          );
        },
      );

      test(
        'Given screen test and class testClass '
        'when tracking screen '
        'then both should be passed into trackers',
        () async {
          await repository.trackScreen(
            screenName: 'test',
            screenClass: 'testClass',
          );
          verify(
            tracker.trackScreen(
              screenName: 'test',
              screenClass: 'testClass',
            ),
          ).called(2);
        },
      );

      test(
        'Given screen test and no class '
        'when tracking screen '
        'then screen and empty class should be passed into trackers',
        () async {
          await repository.trackScreen(screenName: 'test');
          verify(
            tracker.trackScreen(
              screenName: 'test',
            ),
          ).called(2);
        },
      );
    },
  );

  group(
    'Test event tracking via analytics repository',
    () {
      setUp(
        () {
          tracker = MockAnalyticsTracker();
          repository = DefaultAnalyticsRepository(
            trackers: [
              tracker,
              tracker,
            ],
          );
        },
      );

      test(
        'Given event test and some parameter map '
        'when tracking event '
        'then both should be passed into trackers',
        () async {
          final params = {
            'test1': 123,
            'test2': 1.1,
            'test3': 'text',
          };
          await repository.trackEvent(
            name: 'test',
            parameters: params,
          );
          verify(
            tracker.trackEvent(
              name: 'test',
              parameters: params,
            ),
          ).called(2);
        },
      );

      test(
        'Given event test and no parameters '
        'when tracking event '
        'then event name and null parameters '
        'should be passed into trackers',
        () async {
          await repository.trackEvent(name: 'test');
          verify(
            tracker.trackEvent(
              name: 'test',
            ),
          ).called(2);
        },
      );
    },
  );
}
