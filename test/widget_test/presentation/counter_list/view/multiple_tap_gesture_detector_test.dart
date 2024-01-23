import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';
import '../cubit/counter_list_cubit.dart';

void main() {
  late MultipleTapGestureWrapper widget;
  late MockCounterListCubit cubit;

  setUp(() {
    widget = MultipleTapGestureWrapper(
      state: CounterListState.ready(
        counters: List.empty(),
        isCounterOnTapDisabled: false,
      ),
      child: const SizedBox(
        height: 512,
        width: 512,
      ),
    );
    cubit = MockCounterListCubit();
    whenListen(
      cubit,
      Stream.fromIterable(
        [
          const CounterListState.ready(
            counters: [],
            isCounterOnTapDisabled: false,
          ),
        ],
      ),
      initialState: const CounterListState.ready(
        counters: [],
        isCounterOnTapDisabled: false,
      ),
    );
    registerFallbackValue(cubit);
    when(
      () => cubit.incrementCounter(counterIndex: any(named: 'counterIndex')),
    ).thenAnswer(
      (invocation) async {},
    );
  });

  testWidgets(
    'Given one finger touch '
    'when listening for multiple taps '
    'then callback with 0 should be invoked',
    (tester) async {
      await _pumpView(
        tester,
        widget,
        cubit,
      );
      cubit.watchCounters();
      await tester.pumpAndSettle();

      final widgetFinder = find.byWidget(widget);
      final testGesture = await tester.press(widgetFinder);
      await testGesture.up(timeStamp: const Duration(seconds: 1));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      verify(
        () => cubit.incrementCounter(counterIndex: 0),
      ).called(1);
    },
  );

  testWidgets(
    'Given one finger touch '
    'when listening for multiple taps '
    'then callback with 1 should be invoked',
    (tester) async {
      await _pumpView(
        tester,
        widget,
        cubit,
      );
      cubit.watchCounters();
      await tester.pumpAndSettle();

      final widgetFinder = find.byWidget(widget);
      final testGesture = await tester.press(widgetFinder);
      await tester.press(widgetFinder);
      await testGesture.up(timeStamp: const Duration(seconds: 400));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      verify(
        () => cubit.incrementCounter(counterIndex: 1),
      ).called(1);
    },
  );

  testWidgets(
    'Given one finger touch '
    'when listening for multiple taps '
    'then callback with 10 should be invoked',
    (tester) async {
      await _pumpView(
        tester,
        widget,
        cubit,
      );
      cubit.watchCounters();
      await tester.pumpAndSettle();

      final widgetFinder = find.byWidget(widget);
      final testGesture = await tester.press(widgetFinder);
      for (final _ in List.generate(10, (index) => index)) {
        await tester.press(widgetFinder);
      }
      await testGesture.up(timeStamp: const Duration(seconds: 1));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      verify(
        () => cubit.incrementCounter(counterIndex: 10),
      ).called(1);
    },
  );
}

Future<void> _pumpView(
  WidgetTester tester,
  Widget widget,
  CounterListCubit cubit,
) =>
    tester.pumpApp(
      Scaffold(
        body: BlocProvider(
          create: (_) => cubit,
          child: widget,
        ),
      ),
    );
