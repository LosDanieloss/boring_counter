import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/dashboard/dashboard.dart';
import 'package:boring_counter/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      page: DashboardPage,
      path: DashboardPage.path,
      children: [
        AutoRoute(
          page: CounterListPage,
          initial: true,
          path: CounterListPage.path,
        ),
        AutoRoute(
          page: CounterPage,
          path: CounterPage.path,
          maintainState: false,
        ),
      ],
    ),
  ],
)
@Singleton()
class AppRouter extends _$AppRouter {}
