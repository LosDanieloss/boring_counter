import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/domain/counter/counter.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef VerticalDragGestureRecognizerFactory
    = GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>;

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({
    @pathParam this.counterId,
    super.key,
  });

  static const path = 'counter/:counterId';

  final CounterId? counterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<CounterCubit>()..watchCounter(counterId),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  static const _buttonsDistance = 16.0;

  @override
  Widget build(BuildContext context) {
    // TODO(daniel): get default name from localizations
    final maybeState = context.select(
      (CounterCubit cubit) => cubit.state,
    );
    final counterName = maybeState?.name ?? 'Counter';
    return Scaffold(
      appBar: AppBar(title: Text(counterName)),
      body: _VerticalDragWrapper(
        onIncrement: context.read<CounterCubit>().increment,
        onDecrement: context.read<CounterCubit>().decrement,
        child: Center(
          child: (maybeState != null)
              ? const _CounterText()
              : const _MissingCounter(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _IncrementButton(
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: _buttonsDistance),
          _DecrementButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

class _VerticalDragWrapper extends StatelessWidget {
  const _VerticalDragWrapper({
    required this.child,
    this.onIncrement,
    this.onDecrement,
  });

  static const _defaultVelocity = 0;

  static const _incrementVelocityThreshold = 0;

  final Widget child;

  final void Function()? onIncrement;

  final void Function()? onDecrement;

  @override
  Widget build(BuildContext context) => RawGestureDetector(
        behavior: HitTestBehavior.opaque,
        gestures: {
          VerticalDragGestureRecognizer: VerticalDragGestureRecognizerFactory(
            VerticalDragGestureRecognizer.new,
            (VerticalDragGestureRecognizer instance) => {
              instance.onEnd = (details) {
                final velocity = details.primaryVelocity ?? _defaultVelocity;
                if (velocity >= _incrementVelocityThreshold) {
                  onIncrement?.call();
                } else {
                  onDecrement?.call();
                }
              }
            },
          ),
        },
        child: child,
      );
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maybeCounter = context.select((CounterCubit cubit) => cubit.state);
    final count = maybeCounter?.count;
    final isVisible = maybeCounter != null;
    return Visibility(
      visible: isVisible,
      child: Text(
        '$count',
        style: theme.textTheme.displayLarge,
      ),
    );
  }
}

class _IncrementButton extends StatelessWidget {
  const _IncrementButton({
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
}

class _DecrementButton extends StatelessWidget {
  const _DecrementButton({
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
      );
}

class _MissingCounter extends StatelessWidget {
  const _MissingCounter();

  // TODO(daniel): Localize
  @override
  Widget build(BuildContext context) {
    final baseTextStyle =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
    return Center(
      child: Text(
        "You don't any counter selected.\n"
        'Please select on on the list.',
        style: baseTextStyle.copyWith(
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
