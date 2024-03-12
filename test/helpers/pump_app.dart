import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/l10n/l10n.dart';
import 'package:boring_counter/presentation/app/app.dart';
import 'package:boring_counter/presentation/dashboard/dashboard.dart';
import 'package:boring_counter/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<StackRouter>()])
import 'pump_app.mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockStackRouter? testRouter,
  }) {
    final router = testRouter ?? MockStackRouter();
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StackRouterScope(
          controller: router,
          stateHash: 0,
          child: widget,
        ),
      ),
    );
  }

  Future<void> pumpAppAndNavigate({
    required AppRouter router,
    required String path,
  }) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: App(),
      ),
    );
    unawaited(router.replaceNamed(DashboardPage.path));
    await pumpAndSettle();
  }
}
