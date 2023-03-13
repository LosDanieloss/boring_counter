import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart';

@injectable
class ErrorTrackerUseCase {
  ErrorTrackerUseCase({
    required this.crashlyticsRepository,
  });

  /// List of Exceptions Types that should not be tracked
  /// E.g., due to known bug in 3rd party dependency which do not disrupt
  /// the App execution but due to some generic catchers
  /// is being sent to be tracked.
  static List<Type> blacklistedNonFatalExceptions = [];

  final CrashlyticsRepository crashlyticsRepository;

  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    await crashlyticsRepository.trackFatal(
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    final isBlacklisted = blacklistedNonFatalExceptions.any(
      (Type type) => exception.runtimeType == type,
    );
    if (isBlacklisted) {
      return;
    }
    await crashlyticsRepository.trackNonFatal(
      exception: exception,
      stackTrace: stackTrace,
    );
  }
}
