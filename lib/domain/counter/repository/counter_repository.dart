import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

typedef CounterId = String;
typedef CounterName = String;

abstract class CounterRepository {
  LiveData<List<Counter>> watchCounters();

  LiveData<Counter> watchCounter({
    required CounterId counterId,
  });

  Future<Counter> createCounter({
    required CounterName name,
  });

  Future<Counter> getCounter({
    required CounterId counterId,
  });

  Future<Counter> updateCounter({
    required Counter updatedCounter,
  });
}
