import 'package:bloc/bloc.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterCubit extends Cubit<UiCounter?> {
  CounterCubit({
    required this.watchCounterUseCase,
    required this.incrementCounterUseCase,
    required this.decrementCounterUseCase,
    required this.mapper,
  }) : super(null);

  final WatchCounterUseCase watchCounterUseCase;

  final IncrementCounterUseCase incrementCounterUseCase;

  final DecrementCounterUseCase decrementCounterUseCase;

  final UiCounterMapper mapper;

  void watchCounter(CounterId counterId) {
    final counterLiveData = watchCounterUseCase.watch(counterId: counterId)
      ..addObserverWrapper(
        EventObserverWrapper(
          (counter) => _emitCounter(
            counter: counter,
          ),
          Dispatcher.microtask,
        ),
      );
    _emitCounter(
      counter: counterLiveData.value,
    );
  }

  void _emitCounter({
    required Counter counter,
  }) {
    final uiCounter = mapper.toPresentation(
      counter: counter,
    );
    emit(uiCounter);
  }

  Future<void> increment() async {
    final maybeUiCounter = state;
    if (maybeUiCounter != null) {
      final maybeCounter = mapper.toDomain(
        uiCounter: maybeUiCounter,
      );
      await incrementCounterUseCase.increment(
        counter: maybeCounter,
      );
    }
  }

  Future<void> decrement() async {
    final maybeUiCounter = state;
    if (maybeUiCounter != null) {
      final maybeCounter = mapper.toDomain(
        uiCounter: maybeUiCounter,
      );
      await decrementCounterUseCase.decrement(
        counter: maybeCounter,
      );
    }
  }
}
