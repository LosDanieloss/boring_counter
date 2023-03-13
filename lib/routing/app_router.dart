import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:boring_counter/counter/counter.dart';
import 'package:boring_counter/presentation/dashboard/dashboard.dart';
import 'package:boring_counter/presentation/home/home.dart';
import 'package:boring_counter/presentation/splash/splash.dart';

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
          page: HomePage,
          initial: true,
          path: HomePage.path,
        ),
        AutoRoute(
          page: CounterPage,
          path: CounterPage.path,
        ),
      ],
    ),
  ],
)
@Singleton()
class AppRouter extends _$AppRouter {}
