import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';

class MockSplashCubit extends MockCubit<SplashState> implements SplashCubit {}

void main() {
  late MockSplashCubit bloc;

  setUp(() {
    bloc = MockSplashCubit();
  });

  group(
    'building ui',
    () {
      testWidgets(
        'Given initial state '
        'when rendering splash view '
        'then circular progress indicator should be displayed',
        (tester) async {
          prepareBloc(bloc, const SplashState.initial());
          await _pumpSplashView(tester, bloc);

          final progressFinder = find.byType(CircularProgressIndicator);
          expect(progressFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given loading state '
        'when rendering splash view '
        'then circular progress indicator should be displayed',
        (tester) async {
          prepareBloc(bloc, const SplashState.loading());
          await _pumpSplashView(tester, bloc);

          final progressFinder = find.byType(CircularProgressIndicator);
          expect(progressFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given ready state '
        'when rendering splash view '
        'then circular progress indicator should be displayed',
        (tester) async {
          prepareBloc(bloc, const SplashState.ready());
          await _pumpSplashView(tester, bloc);

          final progressFinder = find.byType(CircularProgressIndicator);
          expect(progressFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'navigation',
    () {
      testWidgets(
        'Given ready state '
        'when changing splash view state '
        'then should navigate to dashboard',
        (tester) async {
          final router = MockStackRouter();
          prepareBloc(bloc, const SplashState.ready());
          await _pumpSplashView(tester, bloc, testRouter: router);
          verify(router.replaceNamed('/dashboard'));
        },
      );
    },
  );
}

void prepareBloc(
  MockSplashCubit bloc,
  SplashState state,
) =>
    whenListen(
      bloc,
      Stream.fromIterable([state]),
      initialState: state,
    );

Future<void> _pumpSplashView(
  WidgetTester tester,
  MockSplashCubit bloc, {
  MockStackRouter? testRouter,
}) =>
    tester.pumpApp(
      BlocProvider<SplashCubit>(
        create: (context) => bloc,
        child: const SplashView(),
      ),
      testRouter: testRouter,
    );
