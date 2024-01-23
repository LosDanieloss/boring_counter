import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/view/counter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/helpers.dart';

@GenerateNiceMocks([MockSpec<TabsRouter>()])
import 'counter_item_widget_test.mocks.dart';

void main() {
  late UiCounter counter;
  late MockStackRouter router;
  late MockTabsRouter tabsRouter;

  setUp(() {
    counter = const UiCounter(
      id: 'id',
      name: 'test name',
      count: 404,
    );
    router = MockStackRouter();
    tabsRouter = MockTabsRouter();
  });

  group(
    'Showing correct UI',
    () {
      testWidgets(
        'Given counter '
        'when rendering frame '
        'then counter card is visible',
        (tester) async {
          final itemFinder = find.byType(Card);
          await tester.pumpApp(
            Scaffold(
              body: CounterItemWidget(counter: counter),
            ),
          );
          expect(itemFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counter '
        'when rendering frame '
        'then counter name is visible',
        (tester) async {
          final nameFinder = find.text('test name');
          await tester.pumpApp(
            Scaffold(
              body: CounterItemWidget(counter: counter),
            ),
          );
          expect(nameFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counter '
        'when rendering frame '
        'then counter id is visible',
        (tester) async {
          final idFinder = find.text('id');
          await tester.pumpApp(
            Scaffold(
              body: CounterItemWidget(counter: counter),
            ),
          );
          expect(idFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counter '
        'when rendering frame '
        'then counter count is visible',
        (tester) async {
          final countFinder = find.text('404');
          await tester.pumpApp(
            Scaffold(
              body: CounterItemWidget(counter: counter),
            ),
          );
          expect(countFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Navigation',
    () {
      testWidgets(
        'Given narrow screen and onTap is enabled '
        'when pressing item '
        'then tab is switched',
        (tester) async {
          final itemFinder = find.byType(Card);
          tester.setupNexusScreen();
          await tester.pumpApp(
            Scaffold(
              body: TabsRouterScope(
                stateHash: 404,
                controller: tabsRouter,
                child: CounterItemWidget(
                  counter: counter,
                ),
              ),
            ),
            testRouter: router,
          );
          await tester.tap(itemFinder);
          await tester.pumpAndSettle();
          verify(tabsRouter.navigate(any));
        },
      );

      testWidgets(
        'Given narrow screen and onTap is disabled '
        'when pressing item '
        'then nothing happens',
        (tester) async {
          final itemFinder = find.byType(Card);
          tester.setupNexusScreen();
          await tester.pumpApp(
            Scaffold(
              body: TabsRouterScope(
                stateHash: 404,
                controller: tabsRouter,
                child: CounterItemWidget(
                  counter: counter,
                  isOnTapDisabled: true,
                ),
              ),
            ),
            testRouter: router,
          );
          await tester.tap(itemFinder);
          await tester.pumpAndSettle();
          verifyNever(tabsRouter.navigate(any));
        },
      );

      testWidgets(
        'Given wide screen '
        'when pressing item '
        'then page is replaced',
        (tester) async {
          final itemFinder = find.byType(Card);
          tester.setup4kMonitorScreen();
          await tester.pumpApp(
            Scaffold(
              body: CounterItemWidget(counter: counter),
            ),
            testRouter: router,
          );
          await tester.tap(itemFinder);
          await tester.pumpAndSettle();
          verify(router.replace(any));
        },
      );
    },
  );
}
