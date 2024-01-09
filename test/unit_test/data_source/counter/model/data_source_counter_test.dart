import 'package:boring_counter/data_source/counter/model/data_source_counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Test creating data source counter from JSON',
    () {
      test(
        'Given JSON with only expected field '
        'when parsing data source counter '
        'then it returns proper data source counter object',
        () {
          final json = {
            'id': 'id',
            'name': 'name',
            'count': -1,
          };
          const expectedModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final dataSourceModel = DataSourceCounter.fromJson(json);
          expect(dataSourceModel, expectedModel);
        },
      );

      test(
        'Given JSON with all expected field and few redundant '
        'when parsing data source counter '
        'then it returns proper data source counter object',
        () {
          final json = {
            'id': 'id',
            'name': 'name',
            'count': -1,
            'dummy': 'key',
            'andAnother': 'for testing',
          };
          const expectedModel = DataSourceCounter(
            id: 'id',
            name: 'name',
            count: -1,
          );
          final dataSourceModel = DataSourceCounter.fromJson(json);
          expect(dataSourceModel, expectedModel);
        },
      );

      test(
        'Given JSON with missing expected field '
        'when parsing data source counter '
        'then it throws',
        () {
          final json = {
            'id': 'id',
            'name': 'name',
          };
          expect(
            () => DataSourceCounter.fromJson(json),
            throwsA(
              const TypeMatcher<TypeError>(),
            ),
          );
        },
      );
    },
  );
}
