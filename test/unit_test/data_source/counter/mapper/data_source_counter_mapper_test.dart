import 'package:boring_counter/data_source/counter/mapper/data_source_counter_mapper.dart';
import 'package:boring_counter/data_source/counter/model/data_source_counter.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DataSourceCounterMapper mapper;

  group(
    'Test mapping domain models to data source models',
    () {
      setUp(
        () {
          mapper = DataSourceCounterMapper();
        },
      );

      test(
        'Given domain counter model '
        'when mapping to data source counter model '
        'then model is mapped successfully',
        () {
          const domainModel = Counter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final dataSourceModel = mapper.toDataSource(
            counter: domainModel,
          );
          expect(dataSourceModel, expectedModel);
        },
      );

      test(
        'Given domain counter model '
        'when mapping to data source counter model '
        'then model is matching',
        () {
          const domainModel = Counter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final dataSourceModel = mapper.toDataSource(
            counter: domainModel,
          );
          expect(dataSourceModel, expectedModel);
        },
      );

      test(
        'Given domain counter model '
        'when mapping to data source counter model '
        'then model is not matching',
        () {
          const domainModel = Counter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -4,
          );
          final dataSourceModel = mapper.toDataSource(
            counter: domainModel,
          );
          expect(dataSourceModel, isNot(equals(expectedModel)));
        },
      );
    },
  );

  group(
    'Test mapping data source models to domain models',
    () {
      setUp(
        () {
          mapper = DataSourceCounterMapper();
        },
      );

      test(
        'Given data source counter model '
        'when mapping to domain counter model '
        'then model is mapped successfully',
        () {
          const dataSourceModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = Counter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final domainModel = mapper.toDomain(
            dataSourceCounter: dataSourceModel,
          );
          expect(domainModel, expectedModel);
        },
      );

      test(
        'Given data source counter model '
        'when mapping to domain counter model '
        'then model is matching',
        () {
          const dataSourceModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = Counter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final domainModel = mapper.toDomain(
            dataSourceCounter: dataSourceModel,
          );
          expect(domainModel, expectedModel);
        },
      );

      test(
        'Given data source counter model '
        'when mapping to domain counter model '
        'then model is not matching',
        () {
          const dataSourceModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          const expectedModel = Counter(
            id: 'id',
            name: 'name',
            count: -4,
          );
          final domainModel = mapper.toDomain(
            dataSourceCounter: dataSourceModel,
          );
          expect(domainModel, isNot(equals(expectedModel)));
        },
      );
    },
  );
}
