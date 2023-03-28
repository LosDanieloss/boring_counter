import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const path = '/dashboard';

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        desktop: (_) => const _WidePage(),
        // TODO(daniel): check which one will be rendered if this constraint missing
        tablet: (_) => const _WidePage(),
        mobile: (_) => const _NarrowPage(),
      );
}

class _WidePage extends StatelessWidget {
  const _WidePage();

  @override
  Widget build(BuildContext context) => Row(
        children: const [
          Flexible(
            flex: 44,
            child: CounterListPage(),
          ),
          VerticalDivider(),
          Flexible(
            flex: 55,
            child: AutoRouter(),
          )
        ],
      );
}

class _NarrowPage extends StatelessWidget {
  const _NarrowPage();

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        routes: [
          const CounterListRoute(),
          CounterRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = context.tabsRouter;
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  label: 'Counters',
                  icon: Icon(Icons.list_alt),
                ),
                BottomNavigationBarItem(
                  label: 'Counter',
                  icon: Icon(Icons.calculate_outlined),
                ),
              ],
            ),
          );
        },
      );
}
