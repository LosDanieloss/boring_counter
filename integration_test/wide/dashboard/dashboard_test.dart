import 'package:boring_counter/main_staging.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Given device with wide screen size '
    'when App is launched '
    'then user should see dashboard without bottom navigation',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(BottomNavigationBar), findsNothing);
      expect(find.text('Counters'), findsNothing);
      expect(find.text('Counter'), findsOneWidget);
    },
  );
}
