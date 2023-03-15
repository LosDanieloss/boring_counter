import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_counter.freezed.dart';

@freezed
class UiCounter with _$UiCounter {
  const factory UiCounter({
    required String id,
    required String name,
    required int count,
  }) = _UiCounter;
}
