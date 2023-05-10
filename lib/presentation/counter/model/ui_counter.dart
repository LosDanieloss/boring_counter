import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_counter.freezed.dart';

@Freezed(
  equal: true,
)
class UiCounter with _$UiCounter {
  const factory UiCounter({
    required String id,
    required String name,
    required int count,
  }) = _UiCounter;
}
