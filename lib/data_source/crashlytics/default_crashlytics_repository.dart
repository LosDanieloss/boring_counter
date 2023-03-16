import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CrashlyticsRepository)
class DefaultCrashlyticsRepository implements CrashlyticsRepository {
  DefaultCrashlyticsRepository({
    required this.trackers,
  });

  final List<ErrorTracker> trackers;

  @override
  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackFatal(
        exception: exception,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackNonFatal(
        exception: exception,
        stackTrace: stackTrace,
      );
    }
  }
}
