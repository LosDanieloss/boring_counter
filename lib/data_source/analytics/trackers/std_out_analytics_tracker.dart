import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart';

@injectable
class StdOutAnalyticsTracker extends AnalyticsTracker {
  StdOutAnalyticsTracker({
    required this.logger,
  });

  final Logger logger;

  @override
  Future<void> trackScreen({
    required String screenName,
    String? screenClass,
  }) async {
    if (kDebugMode) {
      logger.i(
        'Tracking screen $screenName of type $screenClass',
      );
    }
  }

  @override
  Future<void> trackEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    if (kDebugMode) {
      final parametersJson = jsonEncode(parameters);
      final parametersString = (parameters == null)
          ? 'without parameters'
          : 'with parameters $parametersJson';
      logger.i(
        'Tracking event $name $parametersString',
      );
    }
  }
}
