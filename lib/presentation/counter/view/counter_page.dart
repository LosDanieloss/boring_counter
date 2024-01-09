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
      body: VerticalDragWrapper(
        onIncrement: context.read<CounterCubit>().increment,
        onDecrement: context.read<CounterCubit>().decrement,
        child: Center(
          child: (maybeState != null)
              ? const CounterText()
              : const MissingCounter(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IncrementButton(
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: _buttonsDistance),
          DecrementButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

class VerticalDragWrapper extends StatelessWidget {
  const VerticalDragWrapper({
    required this.child,
    this.onIncrement,
    this.onDecrement,
    super.key,
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
            (VerticalDragGestureRecognizer instance) =>
                instance.onEnd = (details) {
              final velocity = details.primaryVelocity ?? _defaultVelocity;
              if (velocity >= _incrementVelocityThreshold) {
                onIncrement?.call();
              } else {
                onDecrement?.call();
              }
            },
          ),
        },
        child: child,
      );
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

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

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    required this.onPressed,
    super.key,
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

class DecrementButton extends StatelessWidget {
  const DecrementButton({
    required this.onPressed,
    super.key,
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

class MissingCounter extends StatelessWidget {
  const MissingCounter({super.key});

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
