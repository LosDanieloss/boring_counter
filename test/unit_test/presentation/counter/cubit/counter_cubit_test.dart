// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

@GenerateNiceMocks([
  MockSpec<WatchCounterUseCase>(),
  MockSpec<IncrementCounterUseCase>(),
  MockSpec<DecrementCounterUseCase>(),
  MockSpec<UiCounterMapper>(),
])
import 'counter_cubit_test.mocks.dart';

void main() {
  late MockWatchCounterUseCase watchCounterUseCase;
  late MockIncrementCounterUseCase incrementCounterUseCase;
  late MockDecrementCounterUseCase decrementCounterUseCase;
  const mapper = UiCounterMapper();

  setUp(
    () {
      watchCounterUseCase = MockWatchCounterUseCase();
      incrementCounterUseCase = MockIncrementCounterUseCase();
      decrementCounterUseCase = MockDecrementCounterUseCase();
    },
  );

  group(
    'watching counter',
    () {
      blocTest(
        'Given counter cubit '
        'when created '
        'then it has not emitted any state',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        expect: List.empty,
      );

      blocTest(
        'Given null counter id '
        'when watching counter '
        'then watching is not started and function returns',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        act: (bloc) => bloc..watchCounter(null),
        expect: List.empty,
      );

      blocTest(
        'Given existing counter id '
        'when watching counter '
        'then watching is started and counter is emitted',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          when(watchCounterUseCase.watch(counterId: 'counterId')).thenAnswer(
            (realInvocation) => Stream.value(
              const Counter(
                id: 'id',
                name: 'name',
                count: 0,
              ),
            ),
          );
        },
        act: (bloc) => bloc..watchCounter('counterId'),
        expect: () => [
          const UiCounter(
            id: 'id',
            name: 'name',
            count: 0,
          ),
        ],
      );

      blocTest(
        'Given any problem '
        'when watching counter '
        'then null state should be emitted',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          when(watchCounterUseCase.watch(counterId: 'counterId'))
              .thenThrow(StateError('Dummy error'));
        },
        act: (bloc) => bloc..watchCounter('counterId'),
        expect: () => [null],
      );
    },
  );

  group(
    'increment',
    () {
      blocTest(
        'Given increment counter '
        'when watching counter '
        'then updated counter should be emitted',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          final controller = BehaviorSubject<Counter>()
            ..add(
              const Counter(
                id: 'id',
                name: 'name',
                count: 0,
              ),
            );
          when(watchCounterUseCase.watch(counterId: anyNamed('counterId')))
              .thenAnswer(
            (realInvocation) => controller.stream,
          );
          when(incrementCounterUseCase.increment(counter: anyNamed('counter')))
              .thenAnswer(
            (realInvocation) async {
              final counter = realInvocation.namedArguments[const Symbol(
                'counter',
              )] as Counter;
              final updatedCounter = counter.copyWith(
                count: 1,
              );
              controller.add(updatedCounter);
              return updatedCounter;
            },
          );
        },
        skip: 1,
        act: (bloc) async {
          bloc.watchCounter('id');
          await Future.delayed(const Duration(milliseconds: 32), () => null);
          await bloc.increment();
        },
        expect: () => [
          const UiCounter(
            id: 'id',
            name: 'name',
            count: 1,
          ),
        ],
      );
    },
  );

  group(
    'Decrement',
    () {
      blocTest(
        'Given decrement counter '
        'when watching counter '
        'then updated counter should be emitted',
        build: () => CounterCubit(
          watchCounterUseCase: watchCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          decrementCounterUseCase: decrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          final controller = BehaviorSubject<Counter>()
            ..add(
              const Counter(
                id: 'id',
                name: 'name',
                count: 0,
              ),
            );
          when(watchCounterUseCase.watch(counterId: anyNamed('counterId')))
              .thenAnswer(
            (realInvocation) => controller.stream,
          );
          when(decrementCounterUseCase.decrement(counter: anyNamed('counter')))
              .thenAnswer(
            (realInvocation) async {
              final counter = realInvocation.namedArguments[const Symbol(
                'counter',
              )] as Counter;
              final updatedCounter = counter.copyWith(
                count: -1,
              );
              controller.add(updatedCounter);
              return updatedCounter;
            },
          );
        },
        skip: 1,
        act: (bloc) async {
          bloc.watchCounter('id');
          await Future.delayed(const Duration(milliseconds: 32), () => null);
          await bloc.decrement();
        },
        expect: () => [
          const UiCounter(
            id: 'id',
            name: 'name',
            count: -1,
          ),
        ],
        verify: (bloc) {
          verify(
              decrementCounterUseCase.decrement(counter: anyNamed('counter')));
          verify(watchCounterUseCase.watch(counterId: anyNamed('counterId')));
        },
      );
    },
  );
}
