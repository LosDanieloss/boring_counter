import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCounterUseCase {
  const CreateCounterUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  Future<Counter> create({
    required CounterName name,
  }) =>
      repository.createCounter(
        name: name,
      );
}
