// ignore_for_file: inference_failure_on_function_invocation

import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/splash/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'SplashCubit initializing the App',
    () {
      blocTest(
        'Given no parameters '
        'when initializing the App '
        'then following state are [SplashState.loading, SplashState.ready]',
        build: SplashCubit.new,
        act: (bloc) => bloc.initializeApp(),
        expect: () => [
          const SplashState.loading(),
          const SplashState.ready(),
        ],
      );
    },
  );
}
