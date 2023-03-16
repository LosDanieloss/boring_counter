import 'dart:async';

import 'package:boring_counter/domain/counter/model/counter.dart';
import 'package:boring_counter/domain/counter/repository/counter_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(as: CounterRepository)
class MockCounterRepository implements CounterRepository {
  static const _dummyCounter = Counter(
    id: 'counterId',
    name: 'counterName',
    count: 404,
  );

  static final _dummyCounterList = List.generate(
    1,
    (index) => _dummyCounter,
  );

  static final StreamController<Counter> _counterController = BehaviorSubject()
    ..add(
      _dummyCounter,
    );

  final Stream<Counter> _counterStream = _counterController.stream;

  static final StreamController<List<Counter>> _countersController =
      BehaviorSubject()
        ..add(
          _dummyCounterList,
        );

  final Stream<List<Counter>> _countersStream = _countersController.stream;

  @override
  Future<Counter> createCounter({
    required CounterName name,
  }) async {
    _counterController.add(
      _dummyCounter,
    );
    _countersController.add(
      _dummyCounterList,
    );
    return _dummyCounter;
  }

  @override
  Future<Counter> getCounter({
    required CounterId counterId,
  }) async =>
      _dummyCounter;

  @override
  Future<Counter> updateCounter({
    required Counter updatedCounter,
  }) async {
    _counterController.add(
      updatedCounter,
    );
    _countersController.add(
      _dummyCounterList,
    );
    return updatedCounter;
  }

  @override
  Stream<Counter> watchCounter({
    required CounterId counterId,
  }) =>
      _counterStream;

  @override
  Stream<List<Counter>> watchCounters() => _countersStream;
}
