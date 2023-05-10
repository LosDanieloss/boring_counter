import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CounterRepository>()])
import 'increment_counter_use_case_test.mocks.dart';

void main() {
  const counter = Counter(id: 'id', name: 'name', count: 0);
  late MockCounterRepository repository;
  late IncrementCounterUseCase useCase;

  group(
    'Test decrementing counter',
    () {
      setUp(
        () {
          repository = MockCounterRepository();
          useCase = IncrementCounterUseCase(repository: repository);
        },
      );

      test(
        'Given counter '
        'when incrementing counter '
        'then counter with incremented count should be passed to repository',
        () async {
          when(repository.getCounter(counterId: 'id')).thenAnswer(
            (realInvocation) async => counter,
          );
          const updatedCounter = Counter(id: 'id', name: 'name', count: 1);
          when(
            repository.updateCounter(
              updatedCounter: anyNamed('updatedCounter'),
            ),
          ).thenAnswer(
            (realInvocation) async => updatedCounter,
          );
          final result = await useCase.increment(counter: counter);
          expect(result, updatedCounter);
          verify(repository.getCounter(counterId: 'id'));
          verify(repository.updateCounter(updatedCounter: updatedCounter));
        },
      );
    },
  );
}
