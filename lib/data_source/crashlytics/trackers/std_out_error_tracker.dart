import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart';

@injectable
class StdOutErrorTracker extends ErrorTracker {
  StdOutErrorTracker({
    required this.logger,
  });

  final Logger logger;

  @override
  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    await _log(
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Future<void> _log({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    if (kDebugMode) {
      logger.e(
        exception,
      );
      if (stackTrace != null) {
        logger.e(
          stackTrace,
        );
      }
    }
  }

  @override
  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    await _log(
      exception: exception,
      stackTrace: stackTrace,
    );
  }
}
