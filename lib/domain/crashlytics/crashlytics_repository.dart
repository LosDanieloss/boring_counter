abstract class CrashlyticsRepository {
  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  });

  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  });
}
