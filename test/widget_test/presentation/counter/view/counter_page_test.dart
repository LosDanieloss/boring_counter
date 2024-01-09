import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';

class MockCounterCubit extends MockCubit<UiCounter?> implements CounterCubit {}

void main() {
  late MockCounterCubit cubit;
  late UiCounter counter;

  setUp(() {
    cubit = MockCounterCubit();
    counter = const UiCounter(
      id: 'id',
      name: 'test counter name',
      count: 0,
    );
  });

  group(
    'Show counter',
    () {
      testWidgets(
        'Given no counter '
        'when building counter page '
        'then user should see missing counter widget',
        (tester) async {
          whenListen(
            cubit,
            Stream<UiCounter?>.fromIterable(
              List.empty(),
            ),
            initialState: null,
          );

          await _pumpView(tester, cubit);

          final missingCounterFinder = find.byType(MissingCounter);
          final messageFinder = find.text(
            "You don't any counter selected.\n"
            'Please select on on the list.',
          );

          expect(missingCounterFinder, findsOneWidget);
          expect(messageFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counter '
        'when building counter page '
        'then user should see counter name & value',
        (tester) async {
          whenListen(
            cubit,
            Stream<UiCounter?>.fromIterable(
              [counter],
            ),
            initialState: counter,
          );

          await _pumpView(tester, cubit);

          final counterFinder = find.byType(CounterText);
          final nameFinder = find.text('test counter name');
          final messageFinder = find.text('0');

          expect(counterFinder, findsOneWidget);
          expect(nameFinder, findsOneWidget);
          expect(messageFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Interactions with screen cause no action',
    () {
      setUp(() {
        whenListen(
          cubit,
          Stream<UiCounter?>.fromIterable(
            List.empty(),
          ),
          initialState: null,
        );
        when(cubit.increment).thenAnswer((_) async {});
        when(cubit.decrement).thenAnswer((_) async {});
      });

      testWidgets(
        'Given no counter '
        'when interacting with buttons '
        'then nothing should happen',
        (tester) async {
          await _pumpView(tester, cubit);
          final missingCounterFinder = find.byType(MissingCounter);
          final incrementButtonFinder = find.byType(IncrementButton);
          final decrementButtonFinder = find.byType(DecrementButton);

          await tester.tap(incrementButtonFinder);
          await tester.pumpAndSettle();
          expect(missingCounterFinder, findsOneWidget);

          await tester.tap(decrementButtonFinder);
          await tester.pumpAndSettle();
          expect(missingCounterFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given no counter '
        'when swiping screen up '
        'then nothing should happen',
        (tester) async {
          await _pumpView(tester, cubit);
          final missingCounterFinder = find.byType(MissingCounter);
          final screen = find.byType(Scaffold);

          await tester.drag(screen, const Offset(0, -1));
          await tester.pumpAndSettle();
          expect(missingCounterFinder, findsOneWidget);

          await tester.drag(screen, const Offset(0, -1));
          await tester.pumpAndSettle();
          expect(missingCounterFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Interactions with screen cause counter increment',
    () {
      setUp(() {
        whenListen(
          cubit,
          Stream<UiCounter?>.fromIterable(
            [
              counter,
              counter.copyWith(count: 1),
            ],
          ),
          initialState: counter,
        );
        when(cubit.increment).thenAnswer((_) async {});
      });

      testWidgets(
        'Given counter '
        'when increment button is pressed '
        'then counter value is increased',
        (tester) async {
          final buttonFinder = find.byType(IncrementButton);
          final messageFinder = find.text('1');

          await _pumpView(tester, cubit);
          await tester.tap(buttonFinder);
          await tester.pumpAndSettle();

          expect(messageFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counter '
        'when swiping screen up '
        'then counter value is increased',
        (tester) async {
          final screen = find.byType(Scaffold);
          final messageFinder = find.text('1');

          await _pumpView(tester, cubit);
          await tester.fling(screen, const Offset(0, 300), 800);
          await tester.pumpAndSettle();

          verify(cubit.increment).called(1);
          expect(messageFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Interactions with screen cause counter decrement',
    () {
      setUp(() {
        whenListen(
          cubit,
          Stream<UiCounter?>.fromIterable(
            [
              counter,
              counter.copyWith(count: -1),
            ],
          ),
          initialState: counter,
        );
        when(cubit.decrement).thenAnswer((_) async {});
      });

      testWidgets(
        'Given counter '
        'when decrement button is pressed '
        'then counter value is decreased',
        (tester) async {
          await _pumpView(tester, cubit);
        },
      );

      testWidgets(
        'Given counter '
        'when swiping screen down '
        'then counter value is decreased',
        (tester) async {
          final screen = find.byType(Scaffold);
          final messageFinder = find.text('-1');

          await _pumpView(tester, cubit);
          await tester.fling(screen, const Offset(0, -100), 800);
          await tester.pumpAndSettle();

          verify(cubit.decrement).called(1);
          expect(messageFinder, findsOneWidget);
        },
      );
    },
  );
}

Future<void> _pumpView(
  WidgetTester tester,
  MockCounterCubit bloc, {
  MockStackRouter? testRouter,
}) =>
    tester.pumpApp(
      BlocProvider<CounterCubit>(
        create: (context) => bloc,
        child: const CounterView(),
      ),
      testRouter: testRouter,
    );
