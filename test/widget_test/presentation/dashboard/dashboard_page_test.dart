import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/dashboard/view/dashboard_page.dart';
import 'package:boring_counter/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';
import '../../../helpers/injectable.dart' as test_inject;
import '../counter_list/cubit/counter_list_cubit.dart';

void main() {
  late AppRouter router;

  setUpAll(
    () async {
      await test_inject.configureDependencies();
    },
  );

  group(
    'Test different screen sizes',
    () {
      setUp(
        () {
          router = getIt.get<AppRouter>();
          final counterListCubit =
              getIt.get<CounterListCubit>() as MockCounterListCubit;

          whenListen(
            counterListCubit,
            Stream.fromIterable(
              [
                const CounterListState.ready(
                  counters: [],
                  isCounterOnTapDisabled: false,
                ),
              ],
            ),
            initialState: const CounterListState.ready(
              counters: [],
              isCounterOnTapDisabled: false,
            ),
          );
        },
      );

      testWidgets(
        'Given wide screen '
        'when rendering dashboard page '
        'then should not show bottom navigation',
        (tester) async {
          tester.setup4kMonitorScreen();
          await tester.pumpAppAndNavigate(
            router: router,
            path: DashboardPage.path,
          );

          final dashboardPageFinder = find.byType(DashboardPage);
          final bottomNavigationFinder = find.byType(BottomNavigationBar);

          expect(dashboardPageFinder, findsOneWidget);
          expect(bottomNavigationFinder, findsNothing);

          tester.clearScreenSetup();
        },
      );

      testWidgets(
        'Given narrow screen '
        'when rendering dashboard page '
        'then should show bottom navigation',
        (tester) async {
          tester.setupNexusScreen();
          await tester.pumpAppAndNavigate(
            router: router,
            path: DashboardPage.path,
          );

          final dashboardPageFinder = find.byType(DashboardPage);
          final bottomNavigationFinder = find.byType(BottomNavigationBar);

          expect(dashboardPageFinder, findsOneWidget);
          expect(bottomNavigationFinder, findsOneWidget);

          tester.clearScreenSetup();
        },
      );

      testWidgets(
        'Given narrow screen '
        'when rendering dashboard page '
        'then should show proper buttons in bottom navigation',
        (tester) async {
          tester.setupNexusScreen();
          await tester.pumpAppAndNavigate(
            router: router,
            path: DashboardPage.path,
          );

          final buttonsFinders = [
            'Counters',
            'Counter',
          ].map((text) => find.text(text));

          for (final buttonFinder in buttonsFinders) {
            expect(buttonFinder, findsOneWidget);
          }

          tester.clearScreenSetup();
        },
      );
    },
  );
}
