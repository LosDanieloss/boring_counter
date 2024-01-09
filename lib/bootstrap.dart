import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:boring_counter/di/injectable/configure_injectable.dart';
import 'package:boring_counter/domain/crashlytics/error_tracker_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    required this.errorTrackerUseCase,
  });

  final ErrorTrackerUseCase errorTrackerUseCase;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    errorTrackerUseCase.trackFatal(
      exception: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  final errorTrackerUseCase = getIt.get<ErrorTrackerUseCase>();

  FlutterError.onError = (details) {
    final exception = details.exception;
    final stackTrace = details.stack;
    errorTrackerUseCase.trackFatal(
      exception: exception,
      stackTrace: stackTrace,
    );
  };

  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    errorTrackerUseCase.trackFatal(
      exception: exception,
      stackTrace: stackTrace,
    );
    return true;
  };

  Bloc.observer = AppBlocObserver(
    errorTrackerUseCase: errorTrackerUseCase,
  );

  runApp(await builder());
}
