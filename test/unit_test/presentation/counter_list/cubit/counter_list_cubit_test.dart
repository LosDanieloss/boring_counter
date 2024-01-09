// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

@GenerateNiceMocks([
  MockSpec<WatchCountersUseCase>(),
  MockSpec<CreateCounterUseCase>(),
  MockSpec<IncrementCounterUseCase>(),
  MockSpec<UiCounterMapper>(),
])
import 'counter_list_cubit_test.mocks.dart';

void main() {
  late MockWatchCountersUseCase watchCountersUseCase;
  late MockCreateCounterUseCase createCounterUseCase;
  late MockIncrementCounterUseCase incrementCounterUseCase;
  const mapper = UiCounterMapper();

  setUp(
    () {
      watchCountersUseCase = MockWatchCountersUseCase();
      createCounterUseCase = MockCreateCounterUseCase();
      incrementCounterUseCase = MockIncrementCounterUseCase();
    },
  );

  group(
    'watching counters',
    () {
      blocTest(
        'Given counter list cubit '
        'when created '
        'then it has not emitted any state',
        build: () => CounterListCubit(
          watchCountersUseCase: watchCountersUseCase,
          createCounterUseCase: createCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          mapper: mapper,
        ),
        expect: List.empty,
      );

      blocTest(
        'When watching counter '
        'then watching is started and counter is emitted',
        build: () => CounterListCubit(
          watchCountersUseCase: watchCountersUseCase,
          createCounterUseCase: createCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          when(watchCountersUseCase.watch()).thenAnswer(
            (realInvocation) => Stream.value(
              [
                const Counter(
                  id: 'id',
                  name: 'name',
                  count: 0,
                ),
              ],
            ),
          );
        },
        act: (bloc) => bloc..watchCounters(),
        expect: () => [
          const CounterListState.ready(
            counters: [
              UiCounter(
                id: 'id',
                name: 'name',
                count: 0,
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(watchCountersUseCase.watch());
        },
      );
    },
  );

  group(
    'create',
    () {
      blocTest(
        'Given new counter name '
        'when creating counter '
        'then state with newly created counter should be emitted',
        build: () => CounterListCubit(
          watchCountersUseCase: watchCountersUseCase,
          createCounterUseCase: createCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          final controller = BehaviorSubject<List<Counter>>();
          when(watchCountersUseCase.watch()).thenAnswer(
            (realInvocation) => controller.stream,
          );
          when(createCounterUseCase.create(name: anyNamed('name')))
              .thenAnswer((realInvocation) async {
            const counter = Counter(id: 'id', name: 'name', count: 0);
            controller.add([counter]);
            return counter;
          });
        },
        act: (bloc) async {
          bloc.watchCounters();
          await Future.delayed(const Duration(milliseconds: 32), () => null);
          await bloc.createCounter(name: 'name');
        },
        expect: () => [
          const CounterListState.ready(
            counters: [
              UiCounter(id: 'id', name: 'name', count: 0),
            ],
          ),
        ],
        verify: (_) {
          verify(watchCountersUseCase.watch());
          verify(createCounterUseCase.create(name: anyNamed('name')));
        },
      );
    },
  );

  group(
    'increment',
    () {
      blocTest(
        'Given counter index out of range '
        'when incrementing counter '
        'then nothing should occur',
        build: () => CounterListCubit(
          watchCountersUseCase: watchCountersUseCase,
          createCounterUseCase: createCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          final controller = BehaviorSubject<List<Counter>>()
            ..add(List.empty());
          when(watchCountersUseCase.watch()).thenAnswer(
            (realInvocation) => controller.stream,
          );
        },
        skip: 1,
        act: (bloc) async {
          bloc.watchCounters();
          await Future.delayed(const Duration(milliseconds: 32), () => null);
          await bloc.incrementCounter(counterIndex: 3);
        },
        expect: List.empty,
        verify: (_) {
          verify(watchCountersUseCase.watch());
          verifyNever(
            incrementCounterUseCase.increment(
              counter: anyNamed('counter'),
            ),
          );
        },
      );

      blocTest(
        'Given existing counter index '
        'when incrementing counter '
        'then state with updated counter should be emitted',
        build: () => CounterListCubit(
          watchCountersUseCase: watchCountersUseCase,
          createCounterUseCase: createCounterUseCase,
          incrementCounterUseCase: incrementCounterUseCase,
          mapper: mapper,
        ),
        setUp: () {
          final controller = BehaviorSubject<List<Counter>>()
            ..add([
              const Counter(id: 'id', name: 'name', count: 0),
            ]);
          when(watchCountersUseCase.watch()).thenAnswer(
            (realInvocation) => controller.stream,
          );
          when(incrementCounterUseCase.increment(counter: anyNamed('counter')))
              .thenAnswer((realInvocation) async {
            const updatedCounter = Counter(id: 'id', name: 'name', count: 1);
            controller.add([updatedCounter]);
            return updatedCounter;
          });
        },
        skip: 1,
        act: (bloc) async {
          bloc.watchCounters();
          await Future.delayed(const Duration(milliseconds: 32), () => null);
          await bloc.incrementCounter(counterIndex: 0);
        },
        expect: () => [
          const CounterListState.ready(
            counters: [
              UiCounter(id: 'id', name: 'name', count: 1),
            ],
          ),
        ],
        verify: (_) {
          verify(watchCountersUseCase.watch());
          verify(
            incrementCounterUseCase.increment(
              counter: anyNamed('counter'),
            ),
          );
        },
      );
    },
  );
}
