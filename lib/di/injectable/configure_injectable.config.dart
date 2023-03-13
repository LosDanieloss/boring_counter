// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boring_counter/config/app/app_config.dart' as _i3;
import 'package:boring_counter/config/app/dev_app_config.dart' as _i4;
import 'package:boring_counter/config/app/prod_app_config.dart' as _i5;
import 'package:boring_counter/config/app/staging_app_config.dart' as _i6;
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart'
    as _i20;
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart'
    as _i22;
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart'
    as _i9;
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart'
    as _i16;
import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart'
    as _i24;
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart'
    as _i19;
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart'
    as _i11;
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart'
    as _i17;
import 'package:boring_counter/data_source/local_storage/local_storage.dart'
    as _i12;
import 'package:boring_counter/data_source/local_storage/mock_local_storage.dart'
    as _i13;
import 'package:boring_counter/di/injectable/modules/analytics.dart' as _i30;
import 'package:boring_counter/di/injectable/modules/crashlytics.dart' as _i28;
import 'package:boring_counter/di/injectable/modules/generic.dart' as _i29;
import 'package:boring_counter/domain/analytics/analytics_repository.dart'
    as _i21;
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart'
    as _i26;
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart'
    as _i27;
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart'
    as _i23;
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart'
    as _i25;
import 'package:boring_counter/presentation/splash/cubit/splash_cubit.dart'
    as _i15;
import 'package:boring_counter/routing/app_router.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;
import 'package:uuid/uuid.dart' as _i18;

const String _development = 'development';
const String _production = 'production';
const String _staging = 'staging';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final analyticsModule = _$AnalyticsModule();
  final crashlyticsModule = _$CrashlyticsModule();
  final genericModule = _$GenericModule();
  gh.factory<_i3.AppConfig>(
    () => _i4.DevelopmentAppConfig(),
    registerFor: {_development},
  );
  gh.factory<_i3.AppConfig>(
    () => _i5.ProductionAppConfig(),
    registerFor: {_production},
  );
  gh.factory<_i3.AppConfig>(
    () => _i6.StagingAppConfig(),
    registerFor: {_staging},
  );
  gh.singleton<_i7.AppRouter>(_i7.AppRouter());
  gh.factory<_i8.FirebaseAnalytics>(
      () => analyticsModule.getFirebaseAnalytics());
  gh.factory<_i9.FirebaseAnalyticsTracker>(() =>
      _i9.FirebaseAnalyticsTracker(analytics: gh<_i8.FirebaseAnalytics>()));
  gh.factory<_i10.FirebaseCrashlytics>(
      () => crashlyticsModule.getFirebaseCrashlytics());
  gh.factory<_i11.FirebaseErrorTracker>(() =>
      _i11.FirebaseErrorTracker(crashlytics: gh<_i10.FirebaseCrashlytics>()));
  gh.factory<_i12.LocalStorage>(() => _i13.MockLocalStorage());
  await gh.factoryAsync<_i14.Logger>(
    () => genericModule.getLogger(),
    preResolve: true,
  );
  gh.factory<_i15.SplashCubit>(() => _i15.SplashCubit());
  gh.factory<_i16.StdOutAnalyticsTracker>(
      () => _i16.StdOutAnalyticsTracker(logger: gh<_i14.Logger>()));
  gh.factory<_i17.StdOutErrorTracker>(
      () => _i17.StdOutErrorTracker(logger: gh<_i14.Logger>()));
  await gh.factoryAsync<_i18.Uuid>(
    () => genericModule.getUuidGenerator(),
    preResolve: true,
  );
  gh.factory<List<_i19.ErrorTracker>>(() => crashlyticsModule.getErrorTrackers(
        gh<_i3.AppConfig>(),
        gh<_i11.FirebaseErrorTracker>(),
        gh<_i17.StdOutErrorTracker>(),
      ));
  gh.factory<List<_i20.AnalyticsTracker>>(
      () => analyticsModule.getAnalyticsTrackers(
            gh<_i3.AppConfig>(),
            gh<_i9.FirebaseAnalyticsTracker>(),
            gh<_i16.StdOutAnalyticsTracker>(),
          ));
  gh.factory<_i21.AnalyticsRepository>(() => _i22.DefaultAnalyticsRepository(
      trackers: gh<List<_i20.AnalyticsTracker>>()));
  gh.factory<_i23.CrashlyticsRepository>(() =>
      _i24.DefaultCrashlyticsRepository(
          trackers: gh<List<_i19.ErrorTracker>>()));
  gh.factory<_i25.ErrorTrackerUseCase>(() => _i25.ErrorTrackerUseCase(
      crashlyticsRepository: gh<_i23.CrashlyticsRepository>()));
  gh.factory<_i26.EventTrackerUseCase>(() => _i26.EventTrackerUseCase(
      analyticsRepository: gh<_i21.AnalyticsRepository>()));
  gh.factory<_i27.ScreenTrackerUseCase>(() => _i27.ScreenTrackerUseCase(
      analyticsRepository: gh<_i21.AnalyticsRepository>()));
  return getIt;
}

class _$CrashlyticsModule extends _i28.CrashlyticsModule {}

class _$GenericModule extends _i29.GenericModule {}

class _$AnalyticsModule extends _i30.AnalyticsModule {}
