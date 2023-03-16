import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncrementCounterUseCase {
  const IncrementCounterUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  Future<Counter> increment({
    required Counter counter,
  }) =>
      repository
          .getCounter(
            counterId: counter.id,
          )
          .then(
            (loadedCounter) =>
                loadedCounter.copyWith(count: loadedCounter.count + 1),
          )
          .then(
            (updatedCounter) => repository.updateCounter(
              updatedCounter: updatedCounter,
            ),
          );
}
