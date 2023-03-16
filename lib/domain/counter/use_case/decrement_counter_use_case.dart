import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class DecrementCounterUseCase {
  const DecrementCounterUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  Future<Counter> decrement({
    required Counter counter,
  }) =>
      repository
          .getCounter(
            counterId: counter.id,
          )
          .then(
            (loadedCounter) =>
                loadedCounter.copyWith(count: loadedCounter.count - 1),
          )
          .then(
            (updateCounter) => repository.updateCounter(
              updatedCounter: updateCounter,
            ),
          );
}
