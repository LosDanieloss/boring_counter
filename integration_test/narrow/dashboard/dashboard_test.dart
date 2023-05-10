import 'package:boring_counter/main_staging.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Given device with narrow screen size '
    'when App is launched '
    'then user should see dashboard with bottom navigation',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Counters'), findsOneWidget);
      expect(find.text('Counter'), findsOneWidget);
    },
  );
}
