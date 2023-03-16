import 'package:boring_counter/domain/counter/model/counter.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class UiCounterMapper {
  Counter toDomain({
    required UiCounter uiCounter,
  }) =>
      Counter(
        id: uiCounter.id,
        name: uiCounter.name,
        count: uiCounter.count,
      );

  UiCounter toPresentation({
    required Counter counter,
  }) =>
      UiCounter(
        id: counter.id,
        name: counter.name,
        count: counter.count,
      );
}
