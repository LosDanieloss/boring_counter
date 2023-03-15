import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:uuid/uuid.dart';

class CounterListCubit extends Cubit<CounterListState> {
  CounterListCubit()
      : super(
          CounterListState.loading(
            counters: List.empty(),
          ),
        );

  // FIXME redundant
  static final StreamController<List<UiCounter>> _controller =
      StreamController();

  // TODO(daniel): should watch domain model via use case
  final Stream<List<UiCounter>> _countersStream = _controller.stream;

  void watchCounters() {
    _countersStream.listen((List<UiCounter> counters) {
      emit(
        CounterListState.ready(
          counters: counters,
        ),
      );
    });
    emit(
      CounterListState.ready(
        counters: state.counters,
      ),
    );
  }

  // TODO(daniel): add via use case
  void addCounter() {
    final uuid = const Uuid().v4();
    _controller.add(
      List.of(state.counters)
        ..add(
          UiCounter(
            id: uuid,
            name: 'Counter #${state.counters.length}',
            count: 0,
          ),
        ),
    );
  }

  // TODO(daniel): add via use case
  void incrementCounter({
    required int counterIndex,
  }) {
    if (counterIndex >= state.counters.length) {
      return;
    }
    final counterToUpdate = state.counters[counterIndex];
    final counters = List.of(state.counters);
    counters[counterIndex] = counterToUpdate.copyWith(
      count: counterToUpdate.count + 1,
    );
    emit(
      state.copyWith(
        counters: counters,
      ),
    );
  }
}
