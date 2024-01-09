// ignore_for_file: avoid_catching_errors

import 'dart:async';

import 'package:boring_counter/data_source/counter/repository/memory_counter_repository.dart';
import 'package:boring_counter/data_source/counter/repository/stream_provider.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  // ignore: strict_raw_type
  MockSpec<StreamController>(),
  MockSpec<StreamProvider>(),
])
import 'memory_counter_repository_test.mocks.dart';

void main() {
  late MockStreamController<Counter> counterController;
  late MockStreamController<List<Counter>> countersController;
  late MockStreamProvider provider;
  late CounterRepository repository;

  group(
    'Test creation of new counter',
    () {
      setUp(
        () {
          counterController = MockStreamController();
          countersController = MockStreamController();
          provider = MockStreamProvider();
          when(provider.provideCounterStream()).thenReturn(counterController);
          when(provider.provideCountersStream()).thenReturn(countersController);
          repository = MemoryCounterRepository(
            streamProvider: provider,
          );
        },
      );

      test(
        'Given counter name '
        'when creating new counter '
        'then new counter is created and returned',
        () async {
          final counter = await repository.createCounter(name: 'dummy');
          expect(counter.name, 'dummy');
          expect(counter.count, 0);
        },
      );

      test(
        'Given counter name '
        'when creating new counter '
        'then new stream related to the counter is created '
        'and newly created counter is pushed to it',
        () async {
          final counter = await repository.createCounter(name: 'dummy');
          verify(counterController.add(counter));
        },
      );

      test(
        'Given counter name '
        'when creating new counter '
        'then new counter is added to counters list '
        'and updated list is served to observers',
        () async {
          final counter = await repository.createCounter(name: 'dummy');
          verify(countersController.add(List.of([counter])));
        },
      );

      test(
        'Given counter name twice '
        'when creating new counter '
        'then both counters are added to counters list '
        'and updated list is served to observers',
        () async {
          final firstCounter = await repository.createCounter(name: 'dummy');
          final secondCounter = await repository.createCounter(name: 'test');
          verifyInOrder(
            [
              countersController.add(List.of([firstCounter])),
              countersController.add(List.of([firstCounter, secondCounter])),
            ],
          );
        },
      );
    },
  );

  group(
    'Test retrieving of the counter',
    () {
      late String existingCounterId;
      setUp(
        () async {
          counterController = MockStreamController();
          countersController = MockStreamController();
          provider = MockStreamProvider();
          when(provider.provideCounterStream()).thenReturn(counterController);
          when(provider.provideCountersStream()).thenReturn(countersController);
          repository = MemoryCounterRepository(
            streamProvider: provider,
          );
          existingCounterId =
              (await repository.createCounter(name: 'dummy')).id;
        },
      );

      test(
        'Given existing counter id '
        'when retrieving counter '
        'then should get existing counter',
        () async {
          final counter =
              await repository.getCounter(counterId: existingCounterId);
          expect(
            counter,
            Counter(id: existingCounterId, name: 'dummy', count: 0),
          );
        },
      );

      test(
        'Given not existing counter id '
        'when retrieving counter '
        'then should get exception',
        () async {
          expect(
            () async => repository.getCounter(counterId: 'counterId'),
            throwsStateError,
          );
        },
      );
    },
  );

  group(
    'Test updating the counter',
    () {
      late Counter existingCounter;
      setUp(
        () async {
          counterController = MockStreamController();
          countersController = MockStreamController();
          provider = MockStreamProvider();
          when(provider.provideCounterStream()).thenReturn(counterController);
          when(provider.provideCountersStream()).thenReturn(countersController);
          repository = MemoryCounterRepository(
            streamProvider: provider,
          );
          existingCounter = await repository.createCounter(name: 'dummy');
        },
      );

      test(
        'Given existing counter '
        'when updating counter '
        'then should successfully update counter, '
        'notify listeners and return counter matching provided one',
        () async {
          final updatedCounter = existingCounter.copyWith(
            name: 'updated',
            count: 404,
          );
          final resultCounter = await repository.updateCounter(
            updatedCounter: updatedCounter,
          );
          verifyInOrder(
            [
              counterController.add(existingCounter),
              counterController.add(updatedCounter),
            ],
          );
          verifyInOrder(
            [
              countersController.add(List.empty()),
              countersController.add(List.of([existingCounter])),
              countersController.add(List.of([updatedCounter])),
            ],
          );
          expect(resultCounter, updatedCounter);
        },
      );

      test(
        'Given non existing counter '
        'when updating counter '
        'then should throw without notifying listeners',
        () async {
          const updatedCounter = Counter(
            id: 'dummy',
            name: 'dummy',
            count: -1,
          );
          expect(
            () async =>
                repository.updateCounter(updatedCounter: updatedCounter),
            throwsRangeError,
          );
          verifyNever(counterController.add(updatedCounter));
          verifyNever(countersController.add(List.of([updatedCounter])));
          verifyNever(
            countersController.add(
              List.of(
                [
                  existingCounter,
                  updatedCounter,
                ],
              ),
            ),
          );
        },
      );
    },
  );

  group(
    'Test listening for the counter changes',
    () {
      late Counter counter;
      setUp(
        () async {
          counterController = MockStreamController();
          countersController = MockStreamController();
          provider = MockStreamProvider();
          when(provider.provideCounterStream()).thenReturn(counterController);
          when(provider.provideCountersStream()).thenReturn(countersController);
          repository = MemoryCounterRepository(
            streamProvider: provider,
          );
          counter = await repository.createCounter(name: 'test');
        },
      );

      test(
        'Given that counter is being update three times '
        'when updates to that counter are observed '
        'then observer is notified about all updates',
        () async {
          final afterFirstUpdate = await repository.updateCounter(
            updatedCounter: counter.copyWith(
              name: 'first update',
            ),
          );
          final afterSecondUpdate = await repository.updateCounter(
            updatedCounter: counter.copyWith(
              name: 'second update',
            ),
          );
          final afterThirdUpdate = await repository.updateCounter(
            updatedCounter: counter.copyWith(
              name: 'third update',
            ),
          );
          verifyInOrder(
            [
              counterController.add(counter),
              counterController.add(afterFirstUpdate),
              counterController.add(afterSecondUpdate),
              counterController.add(afterThirdUpdate),
            ],
          );
        },
      );
    },
  );

  group(
    'Test listening for the counter list changes',
    () {
      setUp(
        () {
          counterController = MockStreamController();
          countersController = MockStreamController();
          provider = MockStreamProvider();
          when(provider.provideCounterStream()).thenReturn(counterController);
          when(provider.provideCountersStream()).thenReturn(countersController);
          repository = MemoryCounterRepository(
            streamProvider: provider,
          );
        },
      );

      test(
        'Given new counter is added to list '
        'when counters list is observed '
        'then observer is notified about it',
        () async {
          final counter = await repository.createCounter(name: 'dummy');
          verifyInOrder(
            [
              countersController.add(List.empty()),
              countersController.add(List.of([counter])),
            ],
          );
        },
      );

      test(
        'Given counter is updated '
        'when counters list is observed '
        'then observer is notified about it',
        () async {
          final counter = await repository.createCounter(name: 'dummy');
          final updatedCounter = await repository.updateCounter(
            updatedCounter: counter.copyWith(
              count: 404,
            ),
          );
          verifyInOrder(
            [
              countersController.add(List.empty()),
              countersController.add(List.of([counter])),
              countersController.add(List.of([updatedCounter])),
            ],
          );
        },
      );
    },
  );
}
