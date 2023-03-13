import 'package:injectable/injectable.dart';
import 'package:boring_counter/domain/analytics/analytics_repository.dart';

@injectable
class ScreenTrackerUseCase {
  ScreenTrackerUseCase({
    required this.analyticsRepository,
  });

  final AnalyticsRepository analyticsRepository;

  Future<void> trackScreen({
    required ScreenTrackerNames screenName,
    String? screenClass,
  }) async {
    await analyticsRepository.trackScreen(
      screenName: screenName.rawName,
      screenClass: screenClass,
    );
  }
}

enum ScreenTrackerNames {
  splash('Splash_screen'),
  dashboard('Dashboard'),
  home('Home'),
  counter('Counter');

  const ScreenTrackerNames(this.rawName);

  final String rawName;
}
