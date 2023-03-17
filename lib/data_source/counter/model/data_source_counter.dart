import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_source_counter.freezed.dart';

part 'data_source_counter.g.dart';

@freezed
class DataSourceCounter with _$DataSourceCounter {
  const factory DataSourceCounter({
    required String id,
    required String name,
    required int count,
  }) = _DataSourceCounter;

  factory DataSourceCounter.fromJson(Map<String, Object?> json) =>
      _$DataSourceCounterFromJson(json);
}
