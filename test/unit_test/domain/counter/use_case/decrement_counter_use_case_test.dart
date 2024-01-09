import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CounterRepository>()])
import 'decrement_counter_use_case_test.mocks.dart';

void main() {
  const counter = Counter(id: 'id', name: 'name', count: 0);
  late MockCounterRepository repository;
  late DecrementCounterUseCase useCase;

  group(
    'Test decrementing counter',
    () {
      setUp(
        () {
          repository = MockCounterRepository();
          useCase = DecrementCounterUseCase(repository: repository);
        },
      );

      test(
        'Given counter '
        'when decrementing counter '
        'then counter with decremented count should be passed to repository',
        () async {
          when(repository.getCounter(counterId: 'id')).thenAnswer(
            (realInvocation) async => counter,
          );
          const updatedCounter = Counter(id: 'id', name: 'name', count: -1);
          when(
            repository.updateCounter(
              updatedCounter: anyNamed('updatedCounter'),
            ),
          ).thenAnswer(
            (realInvocation) async => updatedCounter,
          );
          final result = await useCase.decrement(counter: counter);
          expect(result, updatedCounter);
          verify(repository.getCounter(counterId: 'id'));
          verify(repository.updateCounter(updatedCounter: updatedCounter));
        },
      );
    },
  );
}
