import 'package:boring_counter/data_source/analytics/analytics_tracker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseAnalyticsTracker implements AnalyticsTracker {
  FirebaseAnalyticsTracker({
    required this.analytics,
  });

  final FirebaseAnalytics analytics;

  @override
  Future<void> trackScreen({
    required String screenName,
    String? screenClass,
  }) async {
    await analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  @override
  Future<void> trackEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
