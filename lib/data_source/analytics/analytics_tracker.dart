abstract class AnalyticsTracker {
  Future<void> trackScreen({
    required String screenName,
    String? screenClass,
  });

  Future<void> trackEvent({
    required String name,
    Map<String, Object?>? parameters,
  });
}
