import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_list_state.freezed.dart';

@freezed
class CounterListState with _$CounterListState {
  const factory CounterListState.loading({
    required List<UiCounter> counters,
  }) = _LoadingState;
  const factory CounterListState.ready({
    required List<UiCounter> counters,
    required bool isCounterOnTapDisabled,
  }) = ReadyState;
}
