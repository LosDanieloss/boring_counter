import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCountersUseCase {
  const WatchCountersUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  Stream<List<Counter>> watch() => repository.watchCounters();
}
