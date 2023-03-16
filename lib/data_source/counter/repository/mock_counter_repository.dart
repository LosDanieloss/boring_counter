import 'dart:async';

import 'package:boring_counter/domain/counter/model/counter.dart';
import 'package:boring_counter/domain/counter/repository/counter_repository.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CounterRepository)
class MockCounterRepository extends CounterRepository {
  static const _dummyCounter = Counter(
    id: 'counterId',
    name: 'counterName',
    count: 404,
  );

  static final _dummyCounterList = List.generate(
    1,
    (index) => _dummyCounter,
  );

  static final MutableLiveData<Counter> _counterController = MutableLiveData(
    value: _dummyCounter,
  );

  final LiveData<Counter> _counterStream = _counterController;

  static final MutableLiveData<List<Counter>> _countersController =
      MutableLiveData(
    value: _dummyCounterList,
  );

  final LiveData<List<Counter>> _countersStream = _countersController;

  @override
  Future<Counter> createCounter({
    required CounterName name,
  }) async {
    _counterController.postValue(
      _dummyCounter,
    );
    _countersController.postValue(
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
    _counterController.postValue(
      updatedCounter,
    );
    _countersController.postValue(
      _dummyCounterList,
    );
    return updatedCounter;
  }

  @override
  LiveData<Counter> watchCounter({
    required CounterId counterId,
  }) =>
      _counterStream;

  @override
  LiveData<List<Counter>> watchCounters() => _countersStream;
}
