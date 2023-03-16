import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCounterUseCase {
  const WatchCounterUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  Stream<Counter> watch({
    required CounterId counterId,
  }) =>
      repository.watchCounter(
        counterId: counterId,
      );
}
