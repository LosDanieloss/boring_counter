import 'package:injectable/injectable.dart';
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart';
import 'package:boring_counter/domain/analytics/analytics_repository.dart';

@Injectable(as: AnalyticsRepository)
class DefaultAnalyticsRepository extends AnalyticsRepository {
  DefaultAnalyticsRepository({
    required this.trackers,
  });

  final List<AnalyticsTracker> trackers;

  @override
  Future<void> trackScreen({
    required String screenName,
    String? screenClass,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackScreen(
        screenName: screenName,
        screenClass: screenClass,
      );
    }
  }

  @override
  Future<void> trackEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackEvent(
        name: name,
        parameters: parameters,
      );
    }
  }
}
