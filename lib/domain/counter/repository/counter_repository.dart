import 'dart:async';

import 'package:boring_counter/domain/counter/counter.dart';

typedef CounterId = String;
typedef CounterName = String;

abstract class CounterRepository {
  Stream<List<Counter>> watchCounters();

  Stream<Counter> watchCounter({
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
