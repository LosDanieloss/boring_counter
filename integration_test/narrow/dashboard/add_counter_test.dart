import 'package:boring_counter/main_staging.dart' as app;
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/counter_list/view/counter_item_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Given user taps add counter '
    'when on counter list screen '
    'then new counter is added',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final addButtonFinder = find.byType(AddButton);

      expect(addButtonFinder, findsOneWidget);

      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(CounterItemWidget), findsOneWidget);
    },
  );
}
