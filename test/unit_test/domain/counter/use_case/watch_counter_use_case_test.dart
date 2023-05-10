import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CounterRepository>()])
import 'watch_counter_use_case_test.mocks.dart';

void main() {
  late MockCounterRepository repository;
  late WatchCounterUseCase useCase;

  group(
    'Test getting counter stream to watch',
    () {
      setUp(
        () {
          repository = MockCounterRepository();
          useCase = WatchCounterUseCase(repository: repository);
        },
      );

      test(
        'Given counter id '
        'when watching counter '
        'then stream should be returned',
        () {
          final result = useCase.watch(counterId: 'id');
          expect(result, isA<Stream<Counter>>());
          verify(repository.watchCounter(counterId: 'id'));
        },
      );
    },
  );
}
