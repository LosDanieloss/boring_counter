import 'package:bloc/bloc.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';

// TODO(daniel): update via use case
class CounterCubit extends Cubit<UiCounter> {
  CounterCubit({
    required UiCounter counter,
  }) : super(counter);

  void increment() => emit(
        state.copyWith(
          count: state.count + 1,
        ),
      );

  void decrement() => emit(
        state.copyWith(
          count: state.count - 1,
        ),
      );
}
