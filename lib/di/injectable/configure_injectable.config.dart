// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boring_counter/config/app/app_config.dart' as _i3;
import 'package:boring_counter/config/app/dev_app_config.dart' as _i5;
import 'package:boring_counter/config/app/prod_app_config.dart' as _i4;
import 'package:boring_counter/config/app/staging_app_config.dart' as _i6;
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart'
    as _i26;
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart'
    as _i31;
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart'
    as _i10;
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart'
    as _i16;
import 'package:boring_counter/data_source/counter/mapper/data_source_counter_mapper.dart'
    as _i8;
import 'package:boring_counter/data_source/counter/repository/prefs_counter_repository.dart'
    as _i22;
import 'package:boring_counter/data_source/counter/repository/stream_provider.dart'
    as _i18;
import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart'
    as _i35;
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart'
    as _i27;
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart'
    as _i12;
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart'
    as _i17;
import 'package:boring_counter/di/injectable/modules/analytics.dart' as _i39;
import 'package:boring_counter/di/injectable/modules/crashlytics.dart' as _i40;
import 'package:boring_counter/di/injectable/modules/generic.dart' as _i41;
import 'package:boring_counter/domain/analytics/analytics_repository.dart'
    as _i30;
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart'
    as _i37;
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart'
    as _i38;
import 'package:boring_counter/domain/counter/counter.dart' as _i21;
import 'package:boring_counter/domain/counter/use_case/create_counter_use_case.dart'
    as _i23;
import 'package:boring_counter/domain/counter/use_case/decrement_counter_use_case.dart'
    as _i24;
import 'package:boring_counter/domain/counter/use_case/increment_counter_use_case.dart'
    as _i25;
import 'package:boring_counter/domain/counter/use_case/watch_counter_use_case.dart'
    as _i28;
import 'package:boring_counter/domain/counter/use_case/watch_counters_use_case.dart'
    as _i29;
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart'
    as _i34;
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart'
    as _i36;
import 'package:boring_counter/presentation/counter/cubit/counter_cubit.dart'
    as _i32;
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart'
    as _i19;
import 'package:boring_counter/presentation/counter_list/cubit/counter_list_cubit.dart'
    as _i33;
import 'package:boring_counter/presentation/splash/cubit/splash_cubit.dart'
    as _i15;
import 'package:boring_counter/routing/app_router.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i14;
import 'package:uuid/uuid.dart' as _i20;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

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
    () => _i4.ProductionAppConfig(),
    registerFor: {_production},
  );
  gh.factory<_i3.AppConfig>(
    () => _i5.DevelopmentAppConfig(),
    registerFor: {_development},
  );
  gh.factory<_i3.AppConfig>(
    () => _i6.StagingAppConfig(),
    registerFor: {_staging},
  );
  gh.singleton<_i7.AppRouter>(_i7.AppRouter());
  gh.factory<_i8.DataSourceCounterMapper>(() => _i8.DataSourceCounterMapper());
  gh.factory<_i9.FirebaseAnalytics>(
      () => analyticsModule.getFirebaseAnalytics());
  gh.factory<_i10.FirebaseAnalyticsTracker>(() =>
      _i10.FirebaseAnalyticsTracker(analytics: gh<_i9.FirebaseAnalytics>()));
  gh.factory<_i11.FirebaseCrashlytics>(
      () => crashlyticsModule.getFirebaseCrashlytics());
  gh.factory<_i12.FirebaseErrorTracker>(() =>
      _i12.FirebaseErrorTracker(crashlytics: gh<_i11.FirebaseCrashlytics>()));
  await gh.factoryAsync<_i13.Logger>(
    () => genericModule.getLogger(),
    preResolve: true,
  );
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => genericModule.getPreferences(),
    registerFor: {
      _development,
      _staging,
      _production,
    },
    preResolve: true,
  );
  gh.factory<_i15.SplashCubit>(() => _i15.SplashCubit());
  gh.factory<_i16.StdOutAnalyticsTracker>(
      () => _i16.StdOutAnalyticsTracker(logger: gh<_i13.Logger>()));
  gh.factory<_i17.StdOutErrorTracker>(
      () => _i17.StdOutErrorTracker(logger: gh<_i13.Logger>()));
  gh.factory<_i18.StreamProvider>(() => _i18.StreamProvider());
  gh.factory<_i19.UiCounterMapper>(() => const _i19.UiCounterMapper());
  await gh.factoryAsync<_i20.Uuid>(
    () => genericModule.getUuidGenerator(),
    preResolve: true,
  );
  gh.singleton<_i21.CounterRepository>(_i22.PrefsCounterRepository(
    preferences: gh<_i14.SharedPreferences>(),
    mapper: gh<_i8.DataSourceCounterMapper>(),
    streamProvider: gh<_i18.StreamProvider>(),
  ));
  gh.factory<_i23.CreateCounterUseCase>(() =>
      _i23.CreateCounterUseCase(repository: gh<_i21.CounterRepository>()));
  gh.factory<_i24.DecrementCounterUseCase>(() =>
      _i24.DecrementCounterUseCase(repository: gh<_i21.CounterRepository>()));
  gh.factory<_i25.IncrementCounterUseCase>(() =>
      _i25.IncrementCounterUseCase(repository: gh<_i21.CounterRepository>()));
  gh.factory<List<_i26.AnalyticsTracker>>(
      () => analyticsModule.getAnalyticsTrackers(
            gh<_i3.AppConfig>(),
            gh<_i10.FirebaseAnalyticsTracker>(),
            gh<_i16.StdOutAnalyticsTracker>(),
          ));
  gh.factory<List<_i27.ErrorTracker>>(() => crashlyticsModule.getErrorTrackers(
        gh<_i3.AppConfig>(),
        gh<_i12.FirebaseErrorTracker>(),
        gh<_i17.StdOutErrorTracker>(),
      ));
  gh.factory<_i28.WatchCounterUseCase>(
      () => _i28.WatchCounterUseCase(repository: gh<_i21.CounterRepository>()));
  gh.factory<_i29.WatchCountersUseCase>(() =>
      _i29.WatchCountersUseCase(repository: gh<_i21.CounterRepository>()));
  gh.factory<_i30.AnalyticsRepository>(() => _i31.DefaultAnalyticsRepository(
      trackers: gh<List<_i26.AnalyticsTracker>>()));
  gh.factory<_i32.CounterCubit>(
    () => _i32.CounterCubit(
      watchCounterUseCase: gh<_i21.WatchCounterUseCase>(),
      incrementCounterUseCase: gh<_i21.IncrementCounterUseCase>(),
      decrementCounterUseCase: gh<_i21.DecrementCounterUseCase>(),
      mapper: gh<_i19.UiCounterMapper>(),
    ),
    registerFor: {
      _development,
      _staging,
      _production,
    },
  );
  gh.factory<_i33.CounterListCubit>(
    () => _i33.CounterListCubit(
      watchCountersUseCase: gh<_i21.WatchCountersUseCase>(),
      createCounterUseCase: gh<_i21.CreateCounterUseCase>(),
      incrementCounterUseCase: gh<_i21.IncrementCounterUseCase>(),
      mapper: gh<_i19.UiCounterMapper>(),
    ),
    registerFor: {
      _development,
      _staging,
      _production,
    },
  );
  gh.factory<_i34.CrashlyticsRepository>(() =>
      _i35.DefaultCrashlyticsRepository(
          trackers: gh<List<_i27.ErrorTracker>>()));
  gh.factory<_i36.ErrorTrackerUseCase>(() => _i36.ErrorTrackerUseCase(
      crashlyticsRepository: gh<_i34.CrashlyticsRepository>()));
  gh.factory<_i37.EventTrackerUseCase>(() => _i37.EventTrackerUseCase(
      analyticsRepository: gh<_i30.AnalyticsRepository>()));
  gh.factory<_i38.ScreenTrackerUseCase>(() => _i38.ScreenTrackerUseCase(
      analyticsRepository: gh<_i30.AnalyticsRepository>()));
  return getIt;
}

class _$AnalyticsModule extends _i39.AnalyticsModule {}

class _$CrashlyticsModule extends _i40.CrashlyticsModule {}

class _$GenericModule extends _i41.GenericModule {}
