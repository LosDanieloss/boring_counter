import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/di/injectable/configure_injectable.dart';
import 'package:boring_counter/presentation/dashboard/dashboard.dart';
import 'package:boring_counter/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt.get<SplashCubit>()..initializeApp(),
        child: const SplashView(),
      );
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer(
        bloc: context.read<SplashCubit>(),
        builder: (context, SplashState state) => const Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
        ),
        listener: (context, SplashState state) {
          state.mapOrNull(
            initial: null,
            loading: null,
            ready: (_) => _navigatePastSplash(
              context: context,
            ),
          );
        },
      );

  void _navigatePastSplash({
    required BuildContext context,
  }) {
    context.router.replaceNamed(DashboardPage.path);
  }
}
