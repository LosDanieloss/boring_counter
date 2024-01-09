import 'dart:async';

import 'package:boring_counter/data_source/counter/repository/stream_provider.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:uuid/uuid.dart';

class MemoryCounterRepository implements CounterRepository {
  MemoryCounterRepository({
    required this.streamProvider,
  }) {
    _countersController = streamProvider.provideCountersStream()
      ..add(
        List.empty(),
      );
  }

  final StreamProvider streamProvider;

  List<Counter> _counters = List.empty();

  final Map<CounterId, StreamController<Counter>> _counterControllerMap = {};

  Map<CounterId, Stream<Counter>> get _counterStreamMap =>
      _counterControllerMap.map(
        (id, controller) => MapEntry(id, controller.stream),
      );

  late StreamController<List<Counter>> _countersController;

  Stream<List<Counter>> get _countersStream => _countersController.stream;

  @override
  Future<Counter> createCounter({
    required CounterName name,
  }) async {
    final newCounter = Counter(
      id: const Uuid().v4(),
      name: name,
      count: 0,
    );
    _counters = List.of(_counters)
      ..add(
        newCounter,
      );
    _countersController.add(_counters);
    _counterControllerMap.update(
      newCounter.id,
      (value) => value..add(newCounter),
      ifAbsent: () => streamProvider.provideCounterStream()..add(newCounter),
    );
    return newCounter;
  }

  @override
  Future<Counter> getCounter({
    required CounterId counterId,
  }) async =>
      _counters.firstWhere(
        (element) => element.id == counterId,
      );

  @override
  Future<Counter> updateCounter({
    required Counter updatedCounter,
  }) async {
    final counters = List.of(_counters);
    final updatedCounterIndex = counters.indexWhere(
      (element) => element.id == updatedCounter.id,
    );
    counters
      ..removeAt(
        updatedCounterIndex,
      )
      ..insert(
        updatedCounterIndex,
        updatedCounter,
      );
    _counters = counters;
    _countersController.add(_counters);
    _counterControllerMap[updatedCounter.id]?.add(updatedCounter);
    return updatedCounter;
  }

  @override
  Stream<Counter> watchCounter({
    required CounterId counterId,
  }) =>
      _counterStreamMap[counterId]!;

  @override
  Stream<List<Counter>> watchCounters() => _countersStream;
}
