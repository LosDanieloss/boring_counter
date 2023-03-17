import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/routing/app_router.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const path = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        const CounterListRoute(),
        CounterRoute(),
      ],
      builder: (context, child, _) {
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
}
