import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FirebaseAnalytics>()])
import 'firebase_tracker_test.mocks.dart';

void main() {
  late MockFirebaseAnalytics analytics;
  late FirebaseAnalyticsTracker tracker;

  group(
    'Test screen tracking using Firebase tracker',
    () {
      setUp(
        () {
          analytics = MockFirebaseAnalytics();
          tracker = FirebaseAnalyticsTracker(
            analytics: analytics,
          );
        },
      );

      test(
        'Given screen test and class testClass '
        'when tracking screen '
        'then both should be reported to analytics',
        () async {
          await tracker.trackScreen(
            screenName: 'test',
            screenClass: 'testClass',
          );
          verify(
            analytics.logScreenView(
              screenName: 'test',
              screenClass: 'testClass',
            ),
          );
        },
      );

      test(
        'Given screen test and no class '
        'when tracking screen '
        'then screen and empty class should be reported to analytics',
        () async {
          await tracker.trackScreen(screenName: 'test');
          verify(
            analytics.logScreenView(
              screenName: 'test',
            ),
          );
        },
      );
    },
  );

  group(
    'Test event tracking using Firebase tracker',
    () {
      setUp(
        () {
          analytics = MockFirebaseAnalytics();
          tracker = FirebaseAnalyticsTracker(
            analytics: analytics,
          );
        },
      );

      test(
        'Given event test and some parameter map '
        'when tracking event '
        'then both should be written into analytics',
        () async {
          final params = {
            'test1': 123,
            'test2': 1.1,
            'test3': 'text',
          };
          await tracker.trackEvent(
            name: 'test',
            parameters: params,
          );
          verify(
            analytics.logEvent(
              name: 'test',
              parameters: params,
            ),
          );
        },
      );

      test(
        'Given event test and no parameters '
        'when tracking event '
        'then event name and null parameters '
        'should be written into analytics',
        () async {
          await tracker.trackEvent(name: 'test');
          verify(
            analytics.logEvent(
              name: 'test',
            ),
          );
        },
      );
    },
  );
}
