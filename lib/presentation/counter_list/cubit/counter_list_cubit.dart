import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterListCubit extends Cubit<CounterListState> {
  CounterListCubit({
    required this.watchCountersUseCase,
    required this.createCounterUseCase,
    required this.incrementCounterUseCase,
    required this.mapper,
  }) : super(
          CounterListState.loading(
            counters: List.empty(),
          ),
        );

  final WatchCountersUseCase watchCountersUseCase;

  final CreateCounterUseCase createCounterUseCase;

  final IncrementCounterUseCase incrementCounterUseCase;

  final UiCounterMapper mapper;

  void watchCounters() {
    final countersLiveData = watchCountersUseCase.watch()
      ..addObserverWrapper(
        EventObserverWrapper(
          (counters) => _emitCounters(
            counters: counters,
          ),
          Dispatcher.microtask,
        ),
      );
    _emitCounters(
      counters: countersLiveData.value,
    );
  }

  void _emitCounters({
    required List<Counter> counters,
  }) {
    final uiCounters = counters
        .map(
          (counter) => mapper.toPresentation(
            counter: counter,
          ),
        )
        .toList();
    emit(
      CounterListState.ready(
        counters: uiCounters,
      ),
    );
  }

  Future<void> createCounter({
    required String name,
  }) =>
      createCounterUseCase.create(
        name: name,
      );

  Future<void> incrementCounter({
    required int counterIndex,
  }) async {
    if (counterIndex >= state.counters.length) {
      return;
    }
    final uiCounterToUpdate = state.counters[counterIndex];
    final counterToUpdate = mapper.toDomain(
      uiCounter: uiCounterToUpdate,
    );
    await incrementCounterUseCase.increment(
      counter: counterToUpdate,
    );
  }
}
