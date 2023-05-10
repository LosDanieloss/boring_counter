import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CounterRepository>()])
import 'create_counter_use_case_test.mocks.dart';

void main() {
  late MockCounterRepository repository;
  late CreateCounterUseCase useCase;

  group(
    'Test creating new counter',
    () {
      setUp(
        () {
          repository = MockCounterRepository();
          useCase = CreateCounterUseCase(repository: repository);
        },
      );

      test(
        'Given counter name '
        'when creating new counter '
        'then new counter should be created successfully',
        () async {
          when(repository.createCounter(name: 'dummy name')).thenAnswer(
            (realInvocation) async => const Counter(
              id: 'id',
              name: 'dummy name',
              count: 0,
            ),
          );
          final result = await useCase.create(name: 'dummy name');
          expect(
            result,
            const Counter(
              id: 'id',
              name: 'dummy name',
              count: 0,
            ),
          );
          verify(repository.createCounter(name: 'dummy name'));
        },
      );
    },
  );
}
