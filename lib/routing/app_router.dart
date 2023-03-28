import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/dashboard/dashboard.dart';
import 'package:boring_counter/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@Singleton()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: DashboardRoute.page,
      path: DashboardPage.path,
      children: [
        AutoRoute(
          page: CounterListRoute.page,
          path: CounterListPage.path,
        ),
        CustomRoute(
          page: CounterRoute.page,
          path: CounterPage.path,
          maintainState: false,
          usesPathAsKey: true,
          fullMatch: true,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return TransitionsBuilders.noTransition(
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        ),
      ],
    ),
  ];
}
