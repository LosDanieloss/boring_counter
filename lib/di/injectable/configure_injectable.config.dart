// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boring_counter/config/app/app_config.dart' as _i3;
import 'package:boring_counter/config/app/dev_app_config.dart' as _i6;
import 'package:boring_counter/config/app/prod_app_config.dart' as _i5;
import 'package:boring_counter/config/app/staging_app_config.dart' as _i4;
import 'package:boring_counter/data_source/analytics/analytics_tracker.dart'
    as _i24;
import 'package:boring_counter/data_source/analytics/default_analytics_repository.dart'
    as _i29;
import 'package:boring_counter/data_source/analytics/trackers/firebase_analytics_tracker.dart'
    as _i10;
import 'package:boring_counter/data_source/analytics/trackers/std_out_analytics_tracker.dart'
    as _i19;
import 'package:boring_counter/data_source/crashlytics/default_crashlytics_repository.dart'
    as _i31;
import 'package:boring_counter/data_source/crashlytics/error_tracker.dart'
    as _i23;
import 'package:boring_counter/data_source/crashlytics/trackers/firebase_error_tracker.dart'
    as _i12;
import 'package:boring_counter/data_source/crashlytics/trackers/std_out_error_tracker.dart'
    as _i20;
import 'package:boring_counter/data_source/local_storage/local_storage.dart'
    as _i13;
import 'package:boring_counter/data_source/local_storage/mock_local_storage.dart'
    as _i14;
import 'package:boring_counter/data_source/rest/authentication_rest_client.dart'
    as _i22;
import 'package:boring_counter/data_source/rest/data_rest_client.dart' as _i39;
import 'package:boring_counter/data_source/rest/re_authenticate_interceptor.dart'
    as _i36;
import 'package:boring_counter/data_source/rest/session_interceptor.dart'
    as _i16;
import 'package:boring_counter/data_source/session/default_session_repository.dart'
    as _i26;
import 'package:boring_counter/data_source/session/session_mapper.dart' as _i17;
import 'package:boring_counter/di/injectable/modules/analytics.dart' as _i43;
import 'package:boring_counter/di/injectable/modules/crashlytics.dart' as _i40;
import 'package:boring_counter/di/injectable/modules/generic.dart' as _i42;
import 'package:boring_counter/di/injectable/modules/network.dart' as _i41;
import 'package:boring_counter/domain/analytics/analytics_repository.dart'
    as _i28;
import 'package:boring_counter/domain/analytics/event_tracker_use_case.dart'
    as _i33;
import 'package:boring_counter/domain/analytics/screen_tracker_use_case.dart'
    as _i38;
import 'package:boring_counter/domain/crashlytics/crashlytics_repository.dart'
    as _i30;
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart'
    as _i32;
import 'package:boring_counter/domain/login_use_case.dart' as _i34;
import 'package:boring_counter/domain/logout_use_case.dart' as _i35;
import 'package:boring_counter/domain/session/retrieve_session_use_case.dart'
    as _i37;
import 'package:boring_counter/domain/session/session_repository.dart' as _i25;
import 'package:boring_counter/domain/session/watch_session_use_case.dart'
    as _i27;
import 'package:boring_counter/presentation/splash/cubit/splash_cubit.dart'
    as _i18;
import 'package:boring_counter/routing/app_router.dart' as _i7;
import 'package:dio/dio.dart' as _i8;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i15;
import 'package:uuid/uuid.dart' as _i21;

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
  final networkModule = _$NetworkModule();
  final analyticsModule = _$AnalyticsModule();
  final crashlyticsModule = _$CrashlyticsModule();
  final genericModule = _$GenericModule();
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
  gh.singleton<_i7.AppRouter>(_i7.AppRouter());
  gh.factory<_i8.Dio>(
    () => networkModule.getAuthDio(gh<_i3.AppConfig>()),
    instanceName: 'AuthenticationHttpClient',
  );
  gh.factory<_i9.FirebaseAnalytics>(
      () => analyticsModule.getFirebaseAnalytics());
  gh.factory<_i10.FirebaseAnalyticsTracker>(() =>
      _i10.FirebaseAnalyticsTracker(analytics: gh<_i9.FirebaseAnalytics>()));
  gh.factory<_i11.FirebaseCrashlytics>(
      () => crashlyticsModule.getFirebaseCrashlytics());
  gh.factory<_i12.FirebaseErrorTracker>(() =>
      _i12.FirebaseErrorTracker(crashlytics: gh<_i11.FirebaseCrashlytics>()));
  gh.factory<_i13.LocalStorage>(() => _i14.MockLocalStorage());
  await gh.factoryAsync<_i15.Logger>(
    () => genericModule.getLogger(),
    preResolve: true,
  );
  gh.factory<_i16.SessionInterceptor>(
      () => networkModule.getSessionInterceptor(gh<_i13.LocalStorage>()));
  gh.factory<_i17.SessionMapper>(() => _i17.SessionMapper());
  gh.factory<_i18.SplashCubit>(() => _i18.SplashCubit());
  gh.factory<_i19.StdOutAnalyticsTracker>(
      () => _i19.StdOutAnalyticsTracker(logger: gh<_i15.Logger>()));
  gh.factory<_i20.StdOutErrorTracker>(
      () => _i20.StdOutErrorTracker(logger: gh<_i15.Logger>()));
  await gh.factoryAsync<_i21.Uuid>(
    () => genericModule.getUuidGenerator(),
    preResolve: true,
  );
  gh.lazySingleton<_i22.AuthenticationRestClient>(
      () => networkModule.getAuthClient(
            gh<_i8.Dio>(instanceName: 'AuthenticationHttpClient'),
            gh<_i3.AppConfig>(),
          ));
  gh.factory<List<_i23.ErrorTracker>>(() => crashlyticsModule.getErrorTrackers(
        gh<_i3.AppConfig>(),
        gh<_i12.FirebaseErrorTracker>(),
        gh<_i20.StdOutErrorTracker>(),
      ));
  gh.factory<List<_i24.AnalyticsTracker>>(
      () => analyticsModule.getAnalyticsTrackers(
            gh<_i3.AppConfig>(),
            gh<_i10.FirebaseAnalyticsTracker>(),
            gh<_i19.StdOutAnalyticsTracker>(),
          ));
  gh.singleton<_i25.SessionRepository>(_i26.DefaultSessionRepository(
    authenticationRestClient: gh<_i22.AuthenticationRestClient>(),
    sessionMapper: gh<_i17.SessionMapper>(),
    localStorage: gh<_i13.LocalStorage>(),
  ));
  gh.factory<_i27.WatchSessionUseCase>(() => _i27.WatchSessionUseCase(
      sessionRepository: gh<_i25.SessionRepository>()));
  gh.factory<_i28.AnalyticsRepository>(() => _i29.DefaultAnalyticsRepository(
      trackers: gh<List<_i24.AnalyticsTracker>>()));
  gh.factory<_i30.CrashlyticsRepository>(() =>
      _i31.DefaultCrashlyticsRepository(
          trackers: gh<List<_i23.ErrorTracker>>()));
  gh.factory<_i32.ErrorTrackerUseCase>(() => _i32.ErrorTrackerUseCase(
      crashlyticsRepository: gh<_i30.CrashlyticsRepository>()));
  gh.factory<_i33.EventTrackerUseCase>(() => _i33.EventTrackerUseCase(
      analyticsRepository: gh<_i28.AnalyticsRepository>()));
  gh.factory<_i34.LoginUseCase>(
      () => _i34.LoginUseCase(sessionRepository: gh<_i25.SessionRepository>()));
  gh.factory<_i35.LogoutUseCase>(() =>
      _i35.LogoutUseCase(sessionRepository: gh<_i25.SessionRepository>()));
  gh.factory<_i36.ReAuthenticateInterceptor>(() => networkModule
      .getReAuthenticationInterceptor(gh<_i25.SessionRepository>()));
  gh.factory<_i37.RetrieveSessionUseCase>(() => _i37.RetrieveSessionUseCase(
      sessionRepository: gh<_i25.SessionRepository>()));
  gh.factory<_i38.ScreenTrackerUseCase>(() => _i38.ScreenTrackerUseCase(
      analyticsRepository: gh<_i28.AnalyticsRepository>()));
  gh.factory<_i8.Dio>(
    () => networkModule.getDataDio(
      gh<_i36.ReAuthenticateInterceptor>(),
      gh<_i16.SessionInterceptor>(),
      gh<_i3.AppConfig>(),
    ),
    instanceName: 'DataHttpClient',
  );
  gh.lazySingleton<_i39.DataRestClient>(() => networkModule.getDataClient(
        gh<_i8.Dio>(instanceName: 'DataHttpClient'),
        gh<_i3.AppConfig>(),
      ));
  return getIt;
}

class _$CrashlyticsModule extends _i40.CrashlyticsModule {}

class _$NetworkModule extends _i41.NetworkModule {}

class _$GenericModule extends _i42.GenericModule {}

class _$AnalyticsModule extends _i43.AnalyticsModule {}
