// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CounterListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CounterListPage(),
      );
    },
    CounterRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CounterRouteArgs>(
          orElse: () =>
              CounterRouteArgs(counterId: pathParams.optString('counterId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CounterPage(
          counterId: args.counterId,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [CounterListPage]
class CounterListRoute extends PageRouteInfo<void> {
  const CounterListRoute({List<PageRouteInfo>? children})
      : super(
          CounterListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CounterPage]
class CounterRoute extends PageRouteInfo<CounterRouteArgs> {
  CounterRoute({
    String? counterId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CounterRoute.name,
          args: CounterRouteArgs(
            counterId: counterId,
            key: key,
          ),
          rawPathParams: {'counterId': counterId},
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<CounterRouteArgs> page =
      PageInfo<CounterRouteArgs>(name);
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

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
