// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boring_counter/config/app/app_config.dart' as _i3;
import 'package:boring_counter/config/app/dev_app_config.dart' as _i6;
import 'package:boring_counter/config/app/prod_app_config.dart' as _i5;
import 'package:boring_counter/config/app/staging_app_config.dart' as _i4;
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart'
    as _i30;
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart'
    as _i35;
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart'
    as _i14;
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart'
    as _i20;
import 'package:boring_counter/data_source/counter/mapper/data_source_counter_mapper.dart'
    as _i12;
import 'package:boring_counter/data_source/counter/repository/prefs_counter_repository.dart'
    as _i26;
import 'package:boring_counter/data_source/counter/repository/stream_provider.dart'
    as _i22;
import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart'
    as _i39;
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart'
    as _i31;
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart'
    as _i16;
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart'
    as _i21;
import 'package:boring_counter/di/injectable/modules/analytics.dart' as _i43;
import 'package:boring_counter/di/injectable/modules/crashlytics.dart' as _i44;
import 'package:boring_counter/di/injectable/modules/generic.dart' as _i45;
import 'package:boring_counter/domain/analytics/analytics_repository.dart'
    as _i34;
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart'
    as _i41;
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart'
    as _i42;
import 'package:boring_counter/domain/counter/counter.dart' as _i25;
import 'package:boring_counter/domain/counter/use_case/create_counter_use_case.dart'
    as _i27;
import 'package:boring_counter/domain/counter/use_case/decrement_counter_use_case.dart'
    as _i28;
import 'package:boring_counter/domain/counter/use_case/increment_counter_use_case.dart'
    as _i29;
import 'package:boring_counter/domain/counter/use_case/watch_counter_use_case.dart'
    as _i32;
import 'package:boring_counter/domain/counter/use_case/watch_counters_use_case.dart'
    as _i33;
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart'
    as _i38;
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart'
    as _i40;
import 'package:boring_counter/presentation/counter/counter.dart' as _i8;
import 'package:boring_counter/presentation/counter/cubit/counter_cubit.dart'
    as _i36;
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart'
    as _i23;
import 'package:boring_counter/presentation/counter_list/counter_list.dart'
    as _i10;
import 'package:boring_counter/presentation/counter_list/cubit/counter_list_cubit.dart'
    as _i37;
import 'package:boring_counter/presentation/splash/cubit/splash_cubit.dart'
    as _i19;
import 'package:boring_counter/routing/app_router.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i13;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i17;
import 'package:shared_preferences/shared_preferences.dart' as _i18;
import 'package:uuid/uuid.dart' as _i24;

import '../widget_test/presentation/counter/cubit/counter_cubit.dart' as _i9;
import '../widget_test/presentation/counter_list/cubit/counter_list_cubit.dart'
    as _i11;
import 'test_module.dart' as _i46;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';
const String _tests = 'tests';

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
  final testModule = _$TestModule();
  gh.factory<_i3.AppConfig>(
    () => _i4.StagingAppConfig(),
    registerFor: {_staging},
  );
  gh.factory<_i3.AppConfig>(
    () => _i5.ProductionAppConfig(),
    registerFor: {_production},
  );
  gh.factory<_i3.AppConfig>(
    () => _i6.DevelopmentAppConfig(),
    registerFor: {_development},
  );
  gh.singleton<_i7.AppRouter>(() => _i7.AppRouter());
  gh.singleton<_i8.CounterCubit>(
    () => _i9.MockCounterCubit(),
    registerFor: {_tests},
  );
  gh.singleton<_i10.CounterListCubit>(
    () => _i11.MockCounterListCubit(),
    registerFor: {_tests},
  );
  gh.factory<_i12.DataSourceCounterMapper>(
      () => _i12.DataSourceCounterMapper());
  gh.factory<_i13.FirebaseAnalytics>(
      () => analyticsModule.getFirebaseAnalytics());
  gh.factory<_i14.FirebaseAnalyticsTracker>(() =>
      _i14.FirebaseAnalyticsTracker(analytics: gh<_i13.FirebaseAnalytics>()));
  gh.factory<_i15.FirebaseCrashlytics>(
      () => crashlyticsModule.getFirebaseCrashlytics());
  gh.factory<_i16.FirebaseErrorTracker>(() =>
      _i16.FirebaseErrorTracker(crashlytics: gh<_i15.FirebaseCrashlytics>()));
  await gh.factoryAsync<_i17.Logger>(
    () => genericModule.getLogger(),
    preResolve: true,
  );
  await gh.factoryAsync<_i18.SharedPreferences>(
    () => testModule.getPreferences(),
    registerFor: {_tests},
    preResolve: true,
  );
  await gh.factoryAsync<_i18.SharedPreferences>(
    () => genericModule.getPreferences(),
    registerFor: {
      _development,
      _staging,
      _production,
    },
    preResolve: true,
  );
  gh.factory<_i19.SplashCubit>(() => _i19.SplashCubit());
  gh.factory<_i20.StdOutAnalyticsTracker>(
      () => _i20.StdOutAnalyticsTracker(logger: gh<_i17.Logger>()));
  gh.factory<_i21.StdOutErrorTracker>(
      () => _i21.StdOutErrorTracker(logger: gh<_i17.Logger>()));
  gh.factory<_i22.StreamProvider>(() => _i22.StreamProvider());
  gh.factory<_i23.UiCounterMapper>(() => const _i23.UiCounterMapper());
  await gh.factoryAsync<_i24.Uuid>(
    () => genericModule.getUuidGenerator(),
    preResolve: true,
  );
  gh.singleton<_i25.CounterRepository>(() => _i26.PrefsCounterRepository(
        preferences: gh<_i18.SharedPreferences>(),
        mapper: gh<_i12.DataSourceCounterMapper>(),
        streamProvider: gh<_i22.StreamProvider>(),
      ));
  gh.factory<_i27.CreateCounterUseCase>(() =>
      _i27.CreateCounterUseCase(repository: gh<_i25.CounterRepository>()));
  gh.factory<_i28.DecrementCounterUseCase>(() =>
      _i28.DecrementCounterUseCase(repository: gh<_i25.CounterRepository>()));
  gh.factory<_i29.IncrementCounterUseCase>(() =>
      _i29.IncrementCounterUseCase(repository: gh<_i25.CounterRepository>()));
  gh.factory<List<_i30.AnalyticsTracker>>(
      () => analyticsModule.getAnalyticsTrackers(
            gh<_i3.AppConfig>(),
            gh<_i14.FirebaseAnalyticsTracker>(),
            gh<_i20.StdOutAnalyticsTracker>(),
          ));
  gh.factory<List<_i31.ErrorTracker>>(() => crashlyticsModule.getErrorTrackers(
        gh<_i3.AppConfig>(),
        gh<_i16.FirebaseErrorTracker>(),
        gh<_i21.StdOutErrorTracker>(),
      ));
  gh.factory<_i32.WatchCounterUseCase>(
      () => _i32.WatchCounterUseCase(repository: gh<_i25.CounterRepository>()));
  gh.factory<_i33.WatchCountersUseCase>(() =>
      _i33.WatchCountersUseCase(repository: gh<_i25.CounterRepository>()));
  gh.factory<_i34.AnalyticsRepository>(() => _i35.DefaultAnalyticsRepository(
      trackers: gh<List<_i30.AnalyticsTracker>>()));
  gh.factory<_i36.CounterCubit>(
    () => _i36.CounterCubit(
      watchCounterUseCase: gh<_i25.WatchCounterUseCase>(),
      incrementCounterUseCase: gh<_i25.IncrementCounterUseCase>(),
      decrementCounterUseCase: gh<_i25.DecrementCounterUseCase>(),
      mapper: gh<_i23.UiCounterMapper>(),
    ),
    registerFor: {
      _development,
      _staging,
      _production,
    },
  );
  gh.factory<_i37.CounterListCubit>(
    () => _i37.CounterListCubit(
      watchCountersUseCase: gh<_i25.WatchCountersUseCase>(),
      createCounterUseCase: gh<_i25.CreateCounterUseCase>(),
      incrementCounterUseCase: gh<_i25.IncrementCounterUseCase>(),
      mapper: gh<_i23.UiCounterMapper>(),
    ),
    registerFor: {
      _development,
      _staging,
      _production,
    },
  );
  gh.factory<_i38.CrashlyticsRepository>(() =>
      _i39.DefaultCrashlyticsRepository(
          trackers: gh<List<_i31.ErrorTracker>>()));
  gh.factory<_i40.ErrorTrackerUseCase>(() => _i40.ErrorTrackerUseCase(
      crashlyticsRepository: gh<_i38.CrashlyticsRepository>()));
  gh.factory<_i41.EventTrackerUseCase>(() => _i41.EventTrackerUseCase(
      analyticsRepository: gh<_i34.AnalyticsRepository>()));
  gh.factory<_i42.ScreenTrackerUseCase>(() => _i42.ScreenTrackerUseCase(
      analyticsRepository: gh<_i34.AnalyticsRepository>()));
  return getIt;
}

class _$AnalyticsModule extends _i43.AnalyticsModule {}

class _$CrashlyticsModule extends _i44.CrashlyticsModule {}

class _$GenericModule extends _i45.GenericModule {}

class _$TestModule extends _i46.TestModule {}
