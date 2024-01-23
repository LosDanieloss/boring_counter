import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/counter_list/view/counter_item_widget.dart';
import 'package:boring_counter/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';
import '../../../../helpers/injectable.dart' as test_inject;
import '../cubit/counter_list_cubit.dart';

void main() {
  final shortCountersList = List.generate(
    4,
    (index) => UiCounter(
      id: 'id-$index',
      name: 'name $index',
      count: index,
    ),
  );
  final longCountersList = List.generate(
    32,
    (index) => UiCounter(
      id: 'id-$index',
      name: 'name $index',
      count: index,
    ),
  );
  late MockCounterListCubit cubit;
  late CounterListView listView;

  setUp(
    () {
      cubit = MockCounterListCubit();
      listView = const CounterListView();
      registerFallbackValue(cubit);
    },
  );

  group(
    'Layout depending on screen layout',
    () {
      late AppRouter router;

      setUpAll(
        () async {
          await test_inject.configureDependencies();
        },
      );

      setUp(
        () async {
          router = getIt.get<AppRouter>();
          cubit = getIt.get<CounterListCubit>() as MockCounterListCubit;
          const state = CounterListState.ready(
            counters: [],
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
        },
      );

      testWidgets(
        'Given 4k monitor screen '
        'when rendering page '
        'then wide page should be shown',
        (tester) async {
          final widePageFinder = find.byType(WidePage);
          final countersListFinder = find.byType(CounterListView);
          final counterFinder = find.byType(CounterView);

          tester.setup4kMonitorScreen();
          await tester.pumpAppAndNavigate(
            router: router,
            path: CounterListPage.path,
          );

          expect(widePageFinder, findsOneWidget);
          expect(countersListFinder, findsOneWidget);
          expect(counterFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given phone screen '
        'when rendering page '
        'then narrow page should be shown',
        (tester) async {
          final narrowPageFinder = find.byType(NarrowPage);
          final countersListFinder = find.byType(CounterListView);
          final counterFinder = find.byType(CounterView);

          tester.setupNexusScreen();
          await tester.pumpAppAndNavigate(
            router: router,
            path: CounterListPage.path,
          );

          expect(narrowPageFinder, findsOneWidget);
          expect(countersListFinder, findsOneWidget);
          expect(counterFinder, findsNothing);
        },
      );
    },
  );

  group(
    'Loading counters',
    () {
      testWidgets(
        'Given loading counters '
        'when showing page '
        'then should show progress indicator',
        (tester) async {
          const state = CounterListState.loading(counters: []);
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final loadingFinder = find.byType(LoadingWidget);

          await _pumpView(
            tester,
            listView,
            cubit,
          );

          expect(loadingFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Loaded counters',
    () {
      testWidgets(
        'Given empty counters list '
        'when showing counter list '
        'then should inform user that there are no counters',
        (tester) async {
          const state = CounterListState.ready(
            counters: [],
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final loadingFinder = find.byType(LoadingWidget);
          final countersFinder = find.byType(MaybeCountersWidget);
          final noCounterMessageFinder = find.text(
            "You don't have any counters.\nFeel free to tap '+' and add one.",
          );

          await _pumpView(
            tester,
            listView,
            cubit,
          );

          expect(loadingFinder, findsNothing);
          expect(countersFinder, findsOneWidget);
          expect(noCounterMessageFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Given counters list with 4 elements '
        'when showing counter list '
        'then should show them all',
        (tester) async {
          final state = CounterListState.ready(
            counters: shortCountersList,
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final counterListItemFinder = find.byType(CounterItemWidget);

          await _pumpView(
            tester,
            listView,
            cubit,
          );

          expect(counterListItemFinder, findsNWidgets(4));
        },
      );

      testWidgets(
        'Given counters list with many elements '
        'when showing counter list '
        'then should be able to scroll them',
        (tester) async {
          final state = CounterListState.ready(
            counters: longCountersList,
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final listFinder = find.byType(Scrollable);
          final itemToFindIndex = longCountersList.length - 1;
          final itemFinder = find.byKey(ValueKey('id-$itemToFindIndex'));

          await _pumpView(
            tester,
            listView,
            cubit,
          );
          await tester.scrollUntilVisible(
            itemFinder,
            500,
            scrollable: listFinder,
          );

          expect(itemFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'Creating counter',
    () {
      setUp(
        () {
          when(
            () => cubit.createCounter(
              name: any(named: 'name'),
            ),
          ).thenAnswer((invocation) async {});
        },
      );

      testWidgets(
        'Given loaded counters list '
        'when add button is pressed '
        'then new counter is added to the list ',
        (tester) async {
          final state = CounterListState.ready(
            counters: shortCountersList,
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final addButtonFinder = find.byType(AddButton);

          await _pumpView(
            tester,
            listView,
            cubit,
          );
          await tester.tap(addButtonFinder);
          await tester.pumpAndSettle(
            const Duration(milliseconds: 500),
          );

          expect(addButtonFinder, findsOneWidget);
          verify(() => cubit.createCounter(name: 'Counter #4'));
        },
      );
    },
  );

  group(
    'Toggle counter onTap',
    () {
      setUp(
        () {
          when(
            () => cubit.toggleCounterOnTapDisabled(),
          ).thenAnswer((invocation) async {});
        },
      );

      testWidgets(
        'Given that counters are loading '
        'when lock button is pressed '
        'then toggle counter onTap is called ',
        (tester) async {
          const state = CounterListState.loading(counters: []);
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final lockButtonFinder = find.byType(LockButton);

          await _pumpView(
            tester,
            listView,
            cubit,
          );
          await tester.tap(lockButtonFinder);

          expect(lockButtonFinder, findsOneWidget);
          verify(() => cubit.toggleCounterOnTapDisabled());
        },
      );

      testWidgets(
        'Given loaded counters list '
        'when lock button is pressed '
        'then toggle counter onTap is called ',
        (tester) async {
          final state = CounterListState.ready(
            counters: shortCountersList,
            isCounterOnTapDisabled: false,
          );
          whenListen(
            cubit,
            Stream.fromIterable([state]),
            initialState: state,
          );
          final lockButtonFinder = find.byType(LockButton);

          await _pumpView(
            tester,
            listView,
            cubit,
          );
          await tester.tap(lockButtonFinder);
          await tester.pumpAndSettle(
            const Duration(milliseconds: 500),
          );

          expect(lockButtonFinder, findsOneWidget);
          verify(() => cubit.toggleCounterOnTapDisabled());
        },
      );
    },
  );
}

Future<void> _pumpView(
  WidgetTester tester,
  Widget widget,
  CounterListCubit cubit,
) =>
    tester.pumpApp(
      BlocProvider(
        create: (_) => cubit,
        child: widget,
      ),
    );
