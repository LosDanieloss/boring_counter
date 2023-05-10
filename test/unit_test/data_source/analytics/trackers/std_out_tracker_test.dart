import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Logger>()])
import 'std_out_tracker_test.mocks.dart';

void main() {
  late Logger logger;
  late StdOutAnalyticsTracker tracker;

  group(
    'Test screen tracking using Std out tracker',
    () {
      setUp(
        () {
          logger = MockLogger();
          tracker = StdOutAnalyticsTracker(
            logger: logger,
          );
        },
      );

      test(
        'Given screen test and class testClass '
        'when tracking screen '
        'then both should be written info log into logger',
        () {
          tracker.trackScreen(screenName: 'test', screenClass: 'testClass');
          verify(logger.i('Tracking screen test of type testClass'));
        },
      );

      test(
        'Given screen test and no class '
        'when tracking screen '
        'then screen and null class should be written info log into logger',
        () {
          tracker.trackScreen(screenName: 'test');
          verify(logger.i('Tracking screen test of type null'));
        },
      );
    },
  );

  group(
    'Test event tracking using Std out tracker',
    () {
      setUp(
        () {
          logger = MockLogger();
          tracker = StdOutAnalyticsTracker(
            logger: logger,
          );
        },
      );

      test(
        'Given event test and some parameter map '
        'when tracking event '
        'then both should be written info log into logger',
        () {
          tracker.trackEvent(
            name: 'test',
            parameters: {
              'test1': 123,
              'test2': 1.1,
              'test3': 'text',
            },
          );
          verify(
            logger.i(
              'Tracking event test with parameters '
              '{"test1":123,"test2":1.1,"test3":"text"}',
            ),
          );
        },
      );

      test(
        'Given event test and no parameters '
        'when tracking event '
        'then event name and info about no parameters '
        'should be written info log into logger',
        () {
          tracker.trackEvent(name: 'test');
          verify(logger.i('Tracking event test without parameters'));
        },
      );
    },
  );
}
