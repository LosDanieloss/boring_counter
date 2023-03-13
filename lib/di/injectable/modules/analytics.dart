import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:boring_counter/config/app/app_config.dart';
import 'package:boring_counter/config/app/dev_app_config.dart';
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart';
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart';
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart';

@module
abstract class AnalyticsModule {
  FirebaseAnalytics getFirebaseAnalytics() => FirebaseAnalytics.instance;

  List<AnalyticsTracker> getAnalyticsTrackers(
    AppConfig appConfig,
    FirebaseAnalyticsTracker firebaseAnalyticsTracker,
    StdOutAnalyticsTracker stdOutAnalyticsTracker,
  ) {
    final trackers = <AnalyticsTracker>[
      firebaseAnalyticsTracker,
    ];

    if (appConfig is DevelopmentAppConfig) {
      trackers.add(stdOutAnalyticsTracker);
    }
    return trackers;
  }
}
