import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCountersUseCase {
  const WatchCountersUseCase({
    required this.repository,
  });

  final CounterRepository repository;

  LiveData<List<Counter>> watch() => repository.watchCounters();
}
