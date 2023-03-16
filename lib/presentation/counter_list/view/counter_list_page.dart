import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/counter_list/view/counter_item_widget.dart';
import 'package:boring_counter/presentation/counter_list/view/multiple_tap_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterListPage extends StatelessWidget {
  const CounterListPage({super.key});

  static const path = 'home';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => getIt.get<CounterListCubit>()..watchCounters(),
        child: const _CounterListView(),
      );
}

class _CounterListView extends StatelessWidget {
  const _CounterListView();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder(
          bloc: context.read<CounterListCubit>(),
          builder: (BuildContext context, CounterListState state) {
            return _MultipleTapGestureWrapper(
              state: state,
              child: state.map(
                loading: (loadingState) => Stack(
                  children: [
                    _MaybeCountersWidget(
                      counters: loadingState.counters,
                    ),
                    const _LoadingWidget(),
                  ],
                ),
                ready: (readyState) => _MaybeCountersWidget(
                  counters: readyState.counters,
                ),
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _AddButton(
              onPressed: () => context.read<CounterListCubit>().createCounter(
                    name: 'TODO(daniel)',
                  ),
            ),
          ],
        ),
      );
}

class _MultipleTapGestureWrapper extends StatelessWidget {
  const _MultipleTapGestureWrapper({
    required this.child,
    required this.state,
  });

  final Widget child;

  final CounterListState state;

  @override
  Widget build(BuildContext context) => RawGestureDetector(
        // TODO(daniel): check if opaque behavior is needed after widget tree is done
        behavior: HitTestBehavior.opaque,
        gestures: {
          MultipleTapGestureRecognizer: MultipleTapGestureRecognizerFactory(
            MultipleTapGestureRecognizer.new,
            (MultipleTapGestureRecognizer instance) => {
              instance.onMultipleTap = (additionalFingersCount) {
                if (state is ReadyState) {
                  context.read<CounterListCubit>().incrementCounter(
                        counterIndex: additionalFingersCount,
                      );
                }
              }
            },
          ),
        },
        child: child,
      );
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  static const double _opacity = 0.64;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).dialogBackgroundColor.withOpacity(_opacity),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
}

class _MaybeCountersWidget extends StatelessWidget {
  const _MaybeCountersWidget({
    required this.counters,
  });

  final List<UiCounter> counters;

  @override
  Widget build(BuildContext context) => counters.isEmpty
      ? const _EmptyWidget()
      : _CountersWidget(
          counters: counters,
        );
}

class _CountersWidget extends StatelessWidget {
  const _CountersWidget({
    required this.counters,
  });

  final List<UiCounter> counters;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: counters.length,
        itemBuilder: (context, index) => CounterItemWidget(
          counter: counters[index],
        ),
      );
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  // TODO(daniel): Localize
  @override
  Widget build(BuildContext context) {
    final baseTextStyle =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
    return Center(
      child: Text(
        "You don't have any counters.\nFeel free to tap '+' and add one.",
        style: baseTextStyle.copyWith(
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
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
