import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:injectable/injectable.dart';

@Environment(EnvironmentName.development)
@Environment(EnvironmentName.staging)
@Environment(EnvironmentName.production)
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

  StreamSubscription<List<Counter>>? _maybeSubscription;

  void watchCounters() {
    _maybeSubscription = watchCountersUseCase.watch().listen(
          (counters) => _emitCounters(
            counters: counters,
          ),
        );
  }

  void _emitCounters({
    required List<Counter> counters,
  }) {
    if (isClosed) {
      return;
    }
    final uiCounters = counters
        .map(
          (counter) => mapper.toPresentation(
            counter: counter,
          ),
        )
        .toList();
    final isCounterOnTapDisabled =
        state is ReadyState && (state as ReadyState).isCounterOnTapDisabled;
    emit(
      CounterListState.ready(
        counters: uiCounters,
        isCounterOnTapDisabled: isCounterOnTapDisabled,
      ),
    );
  }

  Future<void> createCounter({
    required String name,
  }) =>
      createCounterUseCase.create(
        name: name,
      );

  Future<void> toggleCounterOnTapDisabled() async {
    if (state is ReadyState) {
      final readyState = state as ReadyState;
      emit(
        readyState.copyWith(
          isCounterOnTapDisabled: !readyState.isCounterOnTapDisabled,
        ),
      );
    }
  }

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

  @override
  Future<void> close() {
    _maybeSubscription?.cancel();
    return super.close();
  }
}
