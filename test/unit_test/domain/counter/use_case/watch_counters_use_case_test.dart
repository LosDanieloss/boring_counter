import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CounterRepository>()])
import 'watch_counter_use_case_test.mocks.dart';

void main() {
  late MockCounterRepository repository;
  late WatchCountersUseCase useCase;

  group(
    'Test getting counters stream to watch',
    () {
      setUp(
        () {
          repository = MockCounterRepository();
          useCase = WatchCountersUseCase(repository: repository);
        },
      );

      test(
        'Given counter id '
        'when watching counter '
        'then stream should be returned',
        () {
          final result = useCase.watch();
          expect(result, isA<Stream<List<Counter>>>());
          verify(repository.watchCounters());
        },
      );
    },
  );
}
