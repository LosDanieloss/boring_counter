import 'package:boring_counter/domain/counter/model/counter.dart';
import 'package:boring_counter/presentation/counter/mapper/ui_counter_mapper.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mapper = UiCounterMapper();

  test(
    'Given presentation counter '
    'when toDomain is invoked '
    'then matching domain counter is returned ',
    () {
      const uiCounter = UiCounter(
        id: 'id',
        name: 'name',
        count: 0,
      );
      final result = mapper.toDomain(uiCounter: uiCounter);
      expect(result, const Counter(id: 'id', name: 'name', count: 0));
    },
  );

  test(
    'Given domain counter '
    'when toPresentation is invoked '
    'then matching presentation counter is returned ',
    () {
      const counter = Counter(
        id: 'id',
        name: 'name',
        count: 0,
      );
      final result = mapper.toPresentation(counter: counter);
      expect(result, const UiCounter(id: 'id', name: 'name', count: 0));
    },
  );
}
