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
    as _i30;
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart'
    as _i32;
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart'
    as _i13;
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart'
    as _i21;
import 'package:boring_counter/data_source/counter/repository/memory_counter_repository.dart'
    as _i9;
import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart'
    as _i34;
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart'
    as _i29;
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart'
    as _i15;
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart'
    as _i22;
import 'package:boring_counter/data_source/local_storage/local_storage.dart'
    as _i17;
import 'package:boring_counter/data_source/local_storage/mock_local_storage.dart'
    as _i18;
import 'package:boring_counter/di/injectable/modules/analytics.dart' as _i40;
import 'package:boring_counter/di/injectable/modules/crashlytics.dart' as _i38;
import 'package:boring_counter/di/injectable/modules/generic.dart' as _i39;
import 'package:boring_counter/domain/analytics/analytics_repository.dart'
    as _i31;
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart'
    as _i36;
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart'
    as _i37;
import 'package:boring_counter/domain/counter/counter.dart' as _i8;
import 'package:boring_counter/domain/counter/use_case/create_counter_use_case.dart'
    as _i10;
import 'package:boring_counter/domain/counter/use_case/decrement_counter_use_case.dart'
    as _i11;
import 'package:boring_counter/domain/counter/use_case/increment_counter_use_case.dart'
    as _i16;
import 'package:boring_counter/domain/counter/use_case/watch_counter_use_case.dart'
    as _i25;
import 'package:boring_counter/domain/counter/use_case/watch_counters_use_case.dart'
    as _i26;
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart'
    as _i33;
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart'
    as _i35;
import 'package:boring_counter/presentation/counter/cubit/counter_cubit.dart'
    as _i27;
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart'
    as _i23;
import 'package:boring_counter/presentation/counter_list/cubit/counter_list_cubit.dart'
    as _i28;
import 'package:boring_counter/presentation/splash/cubit/splash_cubit.dart'
    as _i20;
import 'package:boring_counter/routing/app_router.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i12;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i19;
import 'package:uuid/uuid.dart' as _i24;

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
  gh.singleton<_i8.CounterRepository>(_i9.MemoryCounterRepository());
  gh.factory<_i10.CreateCounterUseCase>(
      () => _i10.CreateCounterUseCase(repository: gh<_i8.CounterRepository>()));
  gh.factory<_i11.DecrementCounterUseCase>(() =>
      _i11.DecrementCounterUseCase(repository: gh<_i8.CounterRepository>()));
  gh.factory<_i12.FirebaseAnalytics>(
      () => analyticsModule.getFirebaseAnalytics());
  gh.factory<_i13.FirebaseAnalyticsTracker>(() =>
      _i13.FirebaseAnalyticsTracker(analytics: gh<_i12.FirebaseAnalytics>()));
  gh.factory<_i14.FirebaseCrashlytics>(
      () => crashlyticsModule.getFirebaseCrashlytics());
  gh.factory<_i15.FirebaseErrorTracker>(() =>
      _i15.FirebaseErrorTracker(crashlytics: gh<_i14.FirebaseCrashlytics>()));
  gh.factory<_i16.IncrementCounterUseCase>(() =>
      _i16.IncrementCounterUseCase(repository: gh<_i8.CounterRepository>()));
  gh.factory<_i17.LocalStorage>(() => _i18.MockLocalStorage());
  await gh.factoryAsync<_i19.Logger>(
    () => genericModule.getLogger(),
    preResolve: true,
  );
  gh.factory<_i20.SplashCubit>(() => _i20.SplashCubit());
  gh.factory<_i21.StdOutAnalyticsTracker>(
      () => _i21.StdOutAnalyticsTracker(logger: gh<_i19.Logger>()));
  gh.factory<_i22.StdOutErrorTracker>(
      () => _i22.StdOutErrorTracker(logger: gh<_i19.Logger>()));
  gh.factory<_i23.UiCounterMapper>(() => _i23.UiCounterMapper());
  await gh.factoryAsync<_i24.Uuid>(
    () => genericModule.getUuidGenerator(),
    preResolve: true,
  );
  gh.factory<_i25.WatchCounterUseCase>(
      () => _i25.WatchCounterUseCase(repository: gh<_i8.CounterRepository>()));
  gh.factory<_i26.WatchCountersUseCase>(
      () => _i26.WatchCountersUseCase(repository: gh<_i8.CounterRepository>()));
  gh.factory<_i27.CounterCubit>(() => _i27.CounterCubit(
        watchCounterUseCase: gh<_i8.WatchCounterUseCase>(),
        incrementCounterUseCase: gh<_i8.IncrementCounterUseCase>(),
        decrementCounterUseCase: gh<_i8.DecrementCounterUseCase>(),
        mapper: gh<_i23.UiCounterMapper>(),
      ));
  gh.factory<_i28.CounterListCubit>(() => _i28.CounterListCubit(
        watchCountersUseCase: gh<_i8.WatchCountersUseCase>(),
        createCounterUseCase: gh<_i8.CreateCounterUseCase>(),
        incrementCounterUseCase: gh<_i8.IncrementCounterUseCase>(),
        mapper: gh<_i23.UiCounterMapper>(),
      ));
  gh.factory<List<_i29.ErrorTracker>>(() => crashlyticsModule.getErrorTrackers(
        gh<_i3.AppConfig>(),
        gh<_i15.FirebaseErrorTracker>(),
        gh<_i22.StdOutErrorTracker>(),
      ));
  gh.factory<List<_i30.AnalyticsTracker>>(
      () => analyticsModule.getAnalyticsTrackers(
            gh<_i3.AppConfig>(),
            gh<_i13.FirebaseAnalyticsTracker>(),
            gh<_i21.StdOutAnalyticsTracker>(),
          ));
  gh.factory<_i31.AnalyticsRepository>(() => _i32.DefaultAnalyticsRepository(
      trackers: gh<List<_i30.AnalyticsTracker>>()));
  gh.factory<_i33.CrashlyticsRepository>(() =>
      _i34.DefaultCrashlyticsRepository(
          trackers: gh<List<_i29.ErrorTracker>>()));
  gh.factory<_i35.ErrorTrackerUseCase>(() => _i35.ErrorTrackerUseCase(
      crashlyticsRepository: gh<_i33.CrashlyticsRepository>()));
  gh.factory<_i36.EventTrackerUseCase>(() => _i36.EventTrackerUseCase(
      analyticsRepository: gh<_i31.AnalyticsRepository>()));
  gh.factory<_i37.ScreenTrackerUseCase>(() => _i37.ScreenTrackerUseCase(
      analyticsRepository: gh<_i31.AnalyticsRepository>()));
  return getIt;
}

class _$CrashlyticsModule extends _i38.CrashlyticsModule {}

class _$GenericModule extends _i39.GenericModule {}

class _$AnalyticsModule extends _i40.AnalyticsModule {}
