// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    CounterListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CounterListPage(),
      );
    },
    CounterRoute.name: (routeData) {
      final args = routeData.argsAs<CounterRouteArgs>(
          orElse: () => const CounterRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CounterPage(
          counterId: args.counterId,
          key: args.key,
        ),
        maintainState: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              CounterListRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              CounterRoute.name,
              path: 'counter',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [CounterListPage]
class CounterListRoute extends PageRouteInfo<void> {
  const CounterListRoute()
      : super(
          CounterListRoute.name,
          path: 'home',
        );

  static const String name = 'CounterListRoute';
}

/// generated route for
/// [CounterPage]
class CounterRoute extends PageRouteInfo<CounterRouteArgs> {
  CounterRoute({
    String? counterId,
    Key? key,
  }) : super(
          CounterRoute.name,
          path: 'counter',
          args: CounterRouteArgs(
            counterId: counterId,
            key: key,
          ),
        );

  static const String name = 'CounterRoute';
}

class CounterRouteArgs {
  const CounterRouteArgs({
    this.counterId,
    this.key,
  });

  final String? counterId;

  final Key? key;

  @override
  String toString() {
    return 'CounterRouteArgs{counterId: $counterId, key: $key}';
  }
}
