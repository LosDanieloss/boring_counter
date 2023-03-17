import 'package:boring_counter/data_source/counter/model/data_source_counter.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class DataSourceCounterMapper {
  Counter toDomain({
    required DataSourceCounter dataSourceCounter,
  }) =>
      Counter(
        id: dataSourceCounter.id,
        name: dataSourceCounter.name,
        count: dataSourceCounter.count,
      );

  DataSourceCounter toDataSource({
    required Counter counter,
  }) =>
      DataSourceCounter(
        id: counter.id,
        name: counter.name,
        count: counter.count,
      );
}
