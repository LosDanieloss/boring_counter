import 'dart:async';
import 'dart:convert';

import 'package:boring_counter/data_source/counter/mapper/data_source_counter_mapper.dart';
import 'package:boring_counter/data_source/counter/model/data_source_counter.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Singleton(as: CounterRepository)
class PrefsCounterRepository implements CounterRepository {
  PrefsCounterRepository({
    required this.preferences,
    required this.mapper,
  }) {
    final counters = _getCounters();
    _publishCounters(
      counters: counters,
    );
    for (final counter in counters) {
      final domainCounter = mapper.toDomain(
        dataSourceCounter: counter,
      );
      _counterControllerMap.update(
        counter.id,
        (value) => BehaviorSubject()..add(domainCounter),
        ifAbsent: () => BehaviorSubject()..add(domainCounter),
      );
    }
  }

  static const String _countersKey = 'counters_key';

  final SharedPreferences preferences;

  final DataSourceCounterMapper mapper;

  final Map<CounterId, StreamController<Counter>> _counterControllerMap = {};

  Map<CounterId, Stream<Counter>> get _counterStreamMap =>
      _counterControllerMap.map(
        (id, controller) => MapEntry(id, controller.stream),
      );

  final StreamController<List<Counter>> _countersController = BehaviorSubject()
    ..add(
      List.empty(),
    );

  Stream<List<Counter>> get _countersStream => _countersController.stream;

  @override
  Future<Counter> createCounter({
    required CounterName name,
  }) async {
    final counter = Counter(
      id: const Uuid().v4(),
      name: name,
      count: 0,
    );
    final dataSourceCounter = mapper.toDataSource(
      counter: counter,
    );
    final counters = _getCounters()..add(dataSourceCounter);
    await _storeCounters(
      counters: counters,
    );
    _publishCounters(
      counters: counters,
    );
    _counterControllerMap.update(
      counter.id,
      (value) => BehaviorSubject()..add(counter),
      ifAbsent: () => BehaviorSubject()..add(counter),
    );

    return counter;
  }

  List<DataSourceCounter> _getCounters() =>
      (preferences.getStringList(_countersKey) ?? List.empty())
          .map(
            (counterJson) => DataSourceCounter.fromJson(
              jsonDecode(
                counterJson,
              ) as Map<String, Object?>,
            ),
          )
          .toList();

  Future<void> _storeCounters({
    required List<DataSourceCounter> counters,
  }) async {
    final counterJsons = counters
        .map(
          (e) => jsonEncode(
            e.toJson(),
          ),
        )
        .toList();
    await preferences.setStringList(
      _countersKey,
      counterJsons,
    );
  }

  void _publishCounters({
    required List<DataSourceCounter> counters,
  }) {
    final countersToPublish = counters.map(
      (dataSourceCounter) {
        final counter = mapper.toDomain(
          dataSourceCounter: dataSourceCounter,
        );
        return counter;
      },
    ).toList();
    _countersController.add(
      countersToPublish,
    );
  }

  @override
  Future<Counter> getCounter({
    required CounterId counterId,
  }) async {
    final dataSourceCounter = _getCounters().firstWhere(
      (element) => element.id == counterId,
    );
    return mapper.toDomain(
      dataSourceCounter: dataSourceCounter,
    );
  }

  @override
  Future<Counter> updateCounter({
    required Counter updatedCounter,
  }) async {
    final counters = _getCounters();
    final counterToUpdateIndex = counters.indexWhere(
      (element) => element.id == updatedCounter.id,
    );
    final dataSourceCounter = mapper.toDataSource(
      counter: updatedCounter,
    );
    counters
      ..removeAt(counterToUpdateIndex)
      ..insert(counterToUpdateIndex, dataSourceCounter);
    await _storeCounters(
      counters: counters,
    );
    _publishCounters(
      counters: counters,
    );
    _counterControllerMap[updatedCounter.id]?.add(
      updatedCounter,
    );
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
